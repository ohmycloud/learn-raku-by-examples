#! /usr/bin/env perl6
use v6;

multi fibonacci (0)  { 1 }

multi fibonacci (1)  { 1 }

multi fibonacci (Int $n --> Int) {
    state %cached;
    return %cached{$n} //= fibonacci($n-1) + fibonacci($n-2);
}

for 0..1000 -> $i {
    say $i.fmt('%3d'), ': ', fibonacci($i);
}

