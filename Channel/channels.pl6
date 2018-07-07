#!/usr/bin/env perl6

use v6;

my Channel $KXGA .= new;

for ^100 {
    $KXGA.send( (100000..200000).pick );
}

my $sums = ( start react whenever $KXGA -> $number {
    say "In thread ", $*THREAD.id;
    say "→ ", (^$number).sum;
} ) for ^10;

await $sums;
