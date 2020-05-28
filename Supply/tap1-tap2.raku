#!/usr/bin/env perl6

my $supply = Supply.interval(0.5);

say "Tap 1\t| Tap 2";
say '_' x 15;

$supply.tap({
    say "$_\t|";
});

sleep 2;

$supply.tap({
    say "\t| $_";
});

sleep 3;