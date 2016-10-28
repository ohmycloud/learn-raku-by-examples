
#! /usr/bin/env perl6
use v6;

sub fibonacci (Int $n where 0..*) {
    if $n == 0 | 1 {
        return 1;
    }
    else {
        return [+] ($n-1, $n-2)».&fibonacci;
    }
}

for 0..1000 -> $i {
    say $i.fmt('%3d'), ': ', fibonacci($i);
}

