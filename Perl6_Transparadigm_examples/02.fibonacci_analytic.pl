#! /usr/bin/env perl6
use v6;

sub fibonacci (Int $n where 0..*  --> Int) {
    constant phi = (1 + sqrt 5) / 2;

    return round( phi**($n+1) / sqrt 5);
}

for 0..1000 -> $i {
    say $i.fmt('%3d'), ': ', fibonacci($i);
}

