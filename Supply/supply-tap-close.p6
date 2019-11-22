#!/usr/bin/env perl6

my $supply = Supply.interval(0.3);
my $tap = $supply.tap({
    .say;
});

sleep 1;
$tap.close;
sleep 2;