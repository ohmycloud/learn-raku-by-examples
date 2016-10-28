#! /usr/bin/env perl6
use v6;

#! /usr/bin/env perl
#use v5.14; use warnings;

my @bottles_of_beer
    = map {join "", "$_ bottle", $_ ne 1 && 's' || '', " of beer"},   # Remove comma for Perl 5
            'No more', 1..99;

my $n = 99;
while ($n > 0) {
    say "@bottles_of_beer[$n] on the wall,\n",
        "@bottles_of_beer[$n].\n",
        "Take one down, pass it around,\n",
        "@bottles_of_beer[--$n] on the wall.\n";
}
