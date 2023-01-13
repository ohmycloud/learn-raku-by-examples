#!/usr/bin/env perl6

use lib '.';
use Range::Grammar;
use Range::Actions;

my $parsed = Range::Grammar.parsefile(
        @*ARGS[0] // 'data/flip-flop.txt',
        :actions(Range::Actions)
        ).made;

for @$parsed -> $line {
    say $line.raku;
    say '-' x 35;
}