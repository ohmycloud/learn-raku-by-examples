#!/usr/bin/env perl6

my $foo = 'bar';
say "match!" if $foo ~~ /bar/;       # Regex match
say "match!" if $foo ~~ "bar";       # String match
say "match!" if $foo ~~ Str;         # Class match
say "match!" if $foo ~~ :(Int, Str); # Signature match (destructure)
