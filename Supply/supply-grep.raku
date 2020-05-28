#!/usr/bin/env perl6

my $supply   = Supply.interval(0.5);
my $filtered = $supply.grep(* %% 2);
$filtered.tap({
    .say;
});

sleep 3;