#!/usr/bin/env perl6

sub MAIN (
        :$host = '0.0.0.0',
        :$vin  = 'LSJA0000000000091,LSJA0000000000092',
        :$port = 3333
          ) {
    for $vin.split(',') -> $vin {
        printf "vin: %s, host: %s, port: %s\n", $vin, $host, $port;
    }
}