unit module NeteaseMusic::Encrypt;

use OpenSSL::CryptTools;
use Base64::Native;
use experimental :pack;
use Digest::MD5;

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
sub encrypted-request($text --> Hash) is export {
    my $secret = create-key(16);
    my $params = aes(aes($text, NONCE), $secret);
    my $encseckey = rsa($secret, PUBKEY, MODULUS);
    my %enc = "params" => $params, "encSecKey" => $encseckey;
    return %enc;
}

# AES 加密算法
sub aes(Str $text, Str $key) is export {
    my Buf $encoded-text = Buf.new($text.encode);
    my $iv = '0102030405060708'.encode('utf-8');
    my $cipher-text = encrypt($encoded-text, :aes128, :$iv, key => $key.encode('utf-8'));
    return base64-encode($cipher-text, :str);
}

# RSA 加密算法
sub rsa($text, $pubkey, $modulus) is export {
    my $rs = :16($text.flip.encode('utf-8').unpack("H*")) ** :16($pubkey) % :16($modulus);
    return sprintf("%0256x", $rs)
}

# 创建随机字符串
sub create-key($size) is export {
    return (Buf.new: (0..255).roll($size)).unpack("H*").substr(0, 16)
}