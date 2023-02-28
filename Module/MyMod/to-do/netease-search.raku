use OpenSSL::CryptTools;
use Base64::Native;
use experimental :pack;
use Digest::MD5;
use JSON::Fast;
use Cro::HTTP::Client;

constant MODULUS is export = '00e0b509f6259df8642dbc35662901477df22677ec152b5ff68ace615bb7' ~
                    'b725152b3ab17a876aea8a5aa76d2e417629ec4ee341f56135fccf695280' ~
                    '104e0312ecbda92557c93870114af6c9d05c4f7f0c3685b7a46bee255932' ~
                    '575cce10b424d813cfe4875d3e82047b97ddef52741d546b8e289dc6935b' ~
                    '3ece0462db0a22b8e7';

constant PUBKEY is export = '010001';
constant NONCE is export  = '0CoJUm6Qyw8W8jud';

# 歌曲加密算法, 基于 https://github.com/yanunon/NeteaseCloudMusic
sub encrypted-id(Str $id) is export {
    my Buf $magic = Buf.new('3go8&$8*3*3h0k(2)2'.encode('utf-8'));
    my $magic-len = $magic.bytes;

    my Buf $song-id = Buf.new($id.encode('utf-8'));
    for $song-id.kv -> $i, $sid {
        $song-id[$i] = $sid +^ $magic[$i % $magic-len];
    }

    my Blob $md5 = md5($song-id);

    return base64-encode($md5, :str).trans: '/+' => '_-';
}

# 加密请求
sub encrypted-request($text is copy --> Hash) is export {
    $text = to-json($text, :!pretty);
    say $text;
    my $secret = create-key(16);
    my $params = aes(aes($text, NONCE), $secret);
    my $encseckey = rsa($secret, PUBKEY, MODULUS);
    my %enc = params => $params, encSecKey => $encseckey;
    return %enc;
}

# AES 加密算法
sub aes(Str $text, Str $key) is export {
    my Buf $encoded-text = Buf.new($text.encode('utf-8'));
    my $iv = '0102030405060708'.encode;
    my $cipher-text = encrypt($encoded-text, :aes128, :$iv, :key($key.encode));
    return base64-encode($cipher-text, :str);
}

# RSA 加密算法
sub rsa($text, $pubkey, $modulus) is export {
    my $rs = :16($text.flip.encode('utf-8').unpack("H*")) ** :16($pubkey) % :16($modulus);
    return sprintf("%0256x", $rs);
}

# 创建随机字符串
sub create-key($size) is export {
    return (Buf.new: (0..255).roll($size)).unpack("H*").substr(0, 16);
}

class Netease {
    has %.headers = Accept          => '*/*',
                    Content-Type    => 'application/x-www-form-urlencoded',
                    User-Agent      => 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.32 Safari/537.36';

    has Str $.search-url = 'http://music.163.com/weapi/cloudsearch/get/web?csrf_token=';
    has Str $.player-url = 'http://music.163.com/weapi/song/enhance/player/url?csrf_token=';
    has Str $.lyric-url  = 'https://music.163.com/weapi/song/lyric';
    has Str $.source     = 'netease';

    method search(Str $keyword where *.chars > 0) {
        my %params = 
            's' => $keyword,
            'type' => '1',
            'offset' => '0',
            'sub' => 'false',
            'limit' => 5;

        my $client = Cro::HTTP::Client.new(headers => |%!headers);
        my $response = await $client.post: $!search-url, body => encrypted-request(%params);
        my $res = await $response.body;
        my $music-info = from-json $res;
        dd $music-info;
    }
}

sub MAIN(:$keyword='葱香科学家') {
    Netease.new.search($keyword);
}