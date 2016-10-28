#! /usr/bin/env perl6
use v6;

sub fibonacci (Int $n) {
    (1, 1, *+* ... *)[$n];
}

for 0..1000 -> $i {
    say $i.fmt('%3d'), ': ', fibonacci($i);
}



