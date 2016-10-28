#! /usr/bin/env perl6
use v6;

sub fibonacci (Int $n) {
    state @sequence = 1,1;

    while @sequence.elems <= $n {
        @sequence.push( @sequence[*-2] + @sequence[*-1] );
    }

    return @sequence[$n];
}

for 0..1000 -> $i {
    say $i.fmt('%3d'), ': ', fibonacci($i);
}

