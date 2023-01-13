#!/usr/bin/env perl6

my $supply = Supply.interval(0.3);
sleep 2;

my $tap = $supply.tap({
    .say;
});
sleep 2;