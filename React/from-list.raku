#!/usr/bin/env perl6

sub MAIN(:number($number)) {
    react {
        whenever Supply.interval(1) {
            whenever Supply.from-list(1..$number) -> $v {
                say $v;
            }
        }
    }
}
