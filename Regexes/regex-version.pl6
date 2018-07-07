#!/usr/bin/env perl6

use v6;

use HTTP::UserAgent;

my $ua = HTTP::UserAgent.new;
$ua.timeout = 10;

my $response = $ua.get("https://ftp.mozilla.org/pub/firefox/releases/");

if $response.is-success {
    say $response.content ~~ m:g{\> (\d+ \. .+?) \/};
} 
