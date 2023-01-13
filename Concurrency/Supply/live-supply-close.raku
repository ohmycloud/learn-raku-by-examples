#!/usr/bin/env perl6

my $supply = Supply.interval(0.4).share;

my $tap1 = $supply.tap: { say "1. $^a" };
sleep 1;

my $tap2 = $supply.tap: { say "2. $^a" };
sleep 1;

$tap1.close;

sleep 1;