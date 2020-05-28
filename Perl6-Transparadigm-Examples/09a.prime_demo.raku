#! /usr/bin/env perl6
use v6;

sub is_prime(Int $n) {
    return $n % all(2..$n.sqrt+1);
}


for 1..1001 -> $n {
    say "$n is prime" if is_prime($n);
}
