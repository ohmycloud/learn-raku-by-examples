#!/usr/bin/env perl6

use lib '.';
use BusInfo::Grammar;
use BusInfo::Action;

my $parsed = BusInfo::Grammar.parsefile(
        @*ARGS[0] // 'data/network.txt',
        :actions(BusInfo::Action)
        ).made;

#say $parsed;