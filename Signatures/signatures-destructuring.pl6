#!/usr/bin/env perl6

use v6;

my %hhgttg = (:40life, :41universe, :42everything);
for %hhgttg -> (:$key, :$value) {
    say "$key → $value";
}
