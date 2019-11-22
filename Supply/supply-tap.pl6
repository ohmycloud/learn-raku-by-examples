#!/usr/bin/env perl6

use v6;

my $supply = supply {
    for 1 .. 10 {
        emit($_);
    }
}
$supply.tap( -> $v { say "First : $v" });
$supply.tap( -> $v { say "Second : $v" });

supply {
    emit($_) for 'a' .. 'e';
}.tap({
 .say;
});


supply {
    for 'a' .. 'e' {
        say "Emitting $_";
        emit($_);
    }
}.tap({
    say "Tap received $_";
})