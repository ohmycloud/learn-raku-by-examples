#!/usr/bin/env perl6

use v6;

my $supply = supply {
    for 1 .. 10 {
        emit($_);
    }
}
$supply.tap( -> $v { say "First : $v" });
$supply.tap( -> $v { say "Second : $v" });
