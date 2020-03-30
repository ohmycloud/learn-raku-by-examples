#!/usr/bin/env perl6
my $supply   = Supply.interval(0.5).share;

$supply.tap: { say "First: $^a" };
sleep 1;

$supply.tap: { say "Second: $^a" };
sleep 1;