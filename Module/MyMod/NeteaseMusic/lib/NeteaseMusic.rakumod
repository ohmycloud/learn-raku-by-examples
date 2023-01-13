use OpenSSL::CryptTools;
use Base64::Native;
use Cro::HTTP::Client;
use JSON::Tiny;

unit class NeteaseMusic:ver<0.0.1>;

has %.headers = 
        "Accept"          => "*/*",
        "Accept-Encoding" => "gzip,deflate,sdch",
        "Accept-Language" => "zh-CN,zh;q=0.8,gl;q=0.6,zh-TW;q=0.4",
        "Connection"      => "keep-alive",
        "Content-Type"    => "application/x-www-form-urlencoded",
        "Host"            => "music.163.com",
        "Referer"         => "http://music.163.com",
        "User-Agent"      => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36";

has $.listening-list-api = 'http://music.163.com/weapi/v1/play/record';
has $.comment_api = 'http://music.163.com/weapi/v1/resource/comments/R_SO_4_%s';
has $.hot-comment = 'http://music.163.com/api/v1/resource/comments/R_SO_4_%s';

constant ENCSECKEY = '00e0b509f6259df8642dbc35662901477df22677ec152b5ff68ace615bb7' ~
                     'b725152b3ab17a876aea8a5aa76d2e417629ec4ee341f56135fccf695280' ~
                     '104e0312ecbda92557c93870114af6c9d05c4f7f0c3685b7a46bee255932' ~
                     '575cce10b424d813cfe4875d3e82047b97ddef52741d546b8e289dc6935b' ~
                     '3ece0462db0a22b8e7';

constant NONCE = '0CoJUm6Qyw8W8jud';

method aes-encrypt(Str $text, Str $key) {
    my Buf $encoded-text = Buf.new($text.encode);
    my $iv = '0102030405060708'.encode('utf-8');
    my $cipher-text = encrypt($encoded-text, :aes128, :$iv, key => $key.encode('utf-8'));
    return base64-encode($cipher-text, :str);
}

method encrypt-param($first-param) {
    my $first-key = NONCE;
    my $second-key = ('F' x 16);
    my $text = (to-json $first-param);

    if $text.chars < 16 {
        my $spaces = 16 - $text.chars;
        $text  = $text ~ (' ' x $spaces);
    }

    if $text.chars > 16 {
        my $add = 16 - $text.chars % 16;
        $text = $text ~ (' ' x $add);
    }

    my $h-enctext = self.aes-encrypt($text, $first-key);

    $h-enctext    = self.aes-encrypt($h-enctext, $second-key);
    return $h-enctext;
}

method params-listening-list($user-id --> Hash) {
    my %hash = 'uid' => $user-id, 'type' => -1, 'limit' => 1000, 'offset' => 0, 'total' => True, 'csrf_token' => '';
    return %hash;
}

method params-comments($page, $page-size) {
    my $offset = int($page - 1) * $page-size;
    my %hash = 'rid' => '', 'offset' => $offset, 'total' => False, 'limit' => $page-size, 'csrf_token' => '';
    return %hash;
}

method get-data($url, $params) {
    my %data = 'params' => $params, 'encSecKey' => ENCSECKEY;
    my $client = Cro::HTTP::Client.new( headers => |%!headers );
    my $resp = await $client.post: $url,  body => %data;
    return $resp;
}

method get-listening-list($user-id) {
    my $first-param = self.params-listening-list($user-id);
    $first-param = self.encrypt-param($first-param);
    my %resp = self.get-data(self.listening-list-api, $first-param);
    %resp ,= 'status' => '1', 'msg' => 'OK';

    if %resp{'code'} != 200 {
        %resp ,= 'status' => '-2', 'msg' => '该用户的听歌排行不可见。';
    }
    return %resp;
}

method get-hot-comment($song-id) {
    my $client = Cro::HTTP::Client.new( headers => self.headers );
    return await $client.get: sprintf($.hot-comment, $song-id);
}

method get-comment($song-id, $page = 1, $page-size = 100) {
    my $first-param = self.params-comments($page, $page-size);
    $first-param = self.encrypt-param($first-param);

    return self.get-data(sprintf($.comment-api, $song-id), $first-param);
}

method get-all-comment($song-id) {

}


=begin pod

=head1 NAME

NeteaseMusic - blah blah blah

=head1 SYNOPSIS

=begin code :lang<raku>

use NeteaseMusic;

=end code

=head1 DESCRIPTION

NeteaseMusic is ...

=head1 AUTHOR

ohmycloud <ohmycloudy@gmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2020 ohmycloud

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
