use OpenSSL::CryptTools;
use Base64::Native;
use experimental :pack;

constant MODULUS = ('00e0b509f6259df8642dbc35662901477df22677ec152b5ff68ace615bb7',
                    'b725152b3ab17a876aea8a5aa76d2e417629ec4ee341f56135fccf695280',
                    '104e0312ecbda92557c93870114af6c9d05c4f7f0c3685b7a46bee255932',
                    '575cce10b424d813cfe4875d3e82047b97ddef52741d546b8e289dc6935b',
                    '3ece0462db0a22b8e7');

constant PUBKEY  = '010001';
constant NONCE   = '0CoJUm6Qyw8W8jud';

# 歌曲加密算法, 基于 https://github.com/yanunon/NeteaseCloudMusic
sub encrypted_id($id) {
    my $magic =  Buf.new('3go8&$8*3*3h0k(2)2'.encode('utf-8')); 
    my $magic_len = $magic.bytes;

    my $song_id = Buf.new($id.encode('utf-8'));
    for $song_id.kv -> $i, $sid {
        $song_id[i] = $sid ^ $magic[$i % $magic_len];
    }

    my $d = Digest::MD5.new;
    my $md5_buf = $d.md5_buf($song_id);
    my $result = base64-encode($md5_buf, :str).substr('/', '_').substr('+', '-');
    return $result;
}

# 登录加密算法, 基于 https://github.com/stkevintan/nw_musicbox
sub encrypted_request($text) {
    my $secret = create_key(16);
    my $params = aes(aes($text.encode('utf-8'), NONCE), $secret);
    my $encseckey = rsa($secret, PUBKEY, MODULUS);
    return "params" => $params, "encSecKey" => $encseckey
}

sub aes($text, $key) {
    my $iv = '0102030405060708'.encode;
    my $key = ('xy' x 16).encode; # 不够 16 位要补足

    # Encrypt.
    my $ciphertext = encrypt($text.encode, :aes256, :$iv, :$key);
    base64-encode($ciphertext, :str);
}

sub rsa($text, $pubkey, $modulus) {
    my $rs = :16($text.flip.encode('utf-8').unpack("H*")) ** :16($pubkey) % :16($modulus);
    return sprintf("%0256x", $rs)
}

sub create_key($size) {
    return (Buf.new: (0..255).roll($size)).unpack("H*").substr(0, 16)
}