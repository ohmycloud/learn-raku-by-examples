use LibUUID;
use Digest::SHA256::Native;
use Cro::HTTP::Client;

unit class YouDao:ver<0.0.1>;

class Translate {
    has $.youdao-url = "http://openapi.youdao.com/api";
    has $.appkey is rw;
    has $.appsecret is rw;
    has $.q is rw;

    method truncate() {
        return Nil if $!q.chars == 0;
        my $size = $!q.chars;
        return $size <= 20 ?? $!q !! $!q.substr(0,10) ~ ($size) ~ $!q.substr($size-10,10)
    }
 
    method encrypt($salt, $curtime) {
        my $signStr = $!appkey ~ self.truncate() ~ $salt ~ $curtime ~ $!appsecret;
        return sha256-hex($signStr.encode('utf-8'))
    }

    method data() {
        my $salt = ~UUID.new; # Create a new UUID
        my $curtime = DateTime.now().Instant.Int;
        my $sign = self.encrypt($salt, $curtime);
        my @keys = <from to signType curtime appKey q salt sign>;
        my @values = << EN zh-CHS v3 $curtime $!appkey $!q $salt $sign>>;
        return @keys Z=> @values;
    }

    method request() {
        my %headers = 'Content-Type' => 'application/x-www-form-urlencoded';
        my $client = Cro::HTTP::Client.new( headers => |%headers );
        my %data = self.data;
        my $resp = await $client.post: $!youdao-url,  body => |%data ;
        return $resp
    }
}

=begin pod

=head1 NAME

Youdao - Translate

=head1 SYNOPSIS

=begin code :lang<perl6>

use YouDao;

sub MAIN($q) {
    constant APP_KEY = 'xxxxxxxxxxxx';
    constant APP_SECRET = 'xxxxxxxxxxxxxxx';
    my $resp = YouDao::Translate.new(appkey => APP_KEY, appsecret => APP_SECRET, q => $q);
    say await $resp.request.body-text();
}
=end code

=head1 DESCRIPTION

Youdao is used for translation.

=head1 AUTHOR

 <ohmycloud@gmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2019 

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
