#!/usr/bin/env perl6

use lib '.';
use Extract::Grammar;
use Extract::Actions;

my $parsed = Extract::Grammar.parsefile(
        @*ARGS[0] // 'data/flip-flop.txt',
        :actions(Extract::Actions)
        ).made;

.Str.say for @$parsed;