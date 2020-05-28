#! /usr/bin/env perl6
use v6;

sub fibonacci (Int $n) {
    constant @sequence :=  1, 1, *+* ... *;

    return @sequence[$n];
}

for 0..1000 -> $i {
    say $i.fmt('%3d'), ': ', fibonacci($i);
}


