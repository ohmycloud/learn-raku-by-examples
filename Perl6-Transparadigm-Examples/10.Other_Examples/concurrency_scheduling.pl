#! /usr/bin/env perl6
use v6;


my @players = < Taylor  Sydney  Evelyn  Laurie  Jan >;

.say for (@players X~ ' vs ' X~ @players)>>.subst(/:s (\S+) vs )> $0/, "Bye for ");


