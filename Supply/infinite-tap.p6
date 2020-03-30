#!/usr/bin/env perl6

my $seq := 1, 2, * + 1 ... *;
my $supply2 = $seq.Supply;
$supply2.tap: { put "Got $^a" }