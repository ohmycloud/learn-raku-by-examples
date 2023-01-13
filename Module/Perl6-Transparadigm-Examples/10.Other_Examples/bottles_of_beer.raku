#! /usr/bin/env perl6
use v6;

sub MAIN(Int $max = 99) {
    constant @bottles_of_beer
        := ('No more', 1, 2...*).map(->$n {"$n bottle{'s' if $n !eqv 1} of beer"});

    for $max...1 -> $n {
        say qq:to<BURP!>
            @bottles_of_beer[$n] on the wall,
            @bottles_of_beer[$n].
            Take one down, pass it around,
            @bottles_of_beer[$n-1] on the wall.
            BURP!
    }
}
