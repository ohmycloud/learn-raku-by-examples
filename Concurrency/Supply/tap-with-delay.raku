#!/usr/bin/env perl6

my $supply = supply {
    emit($_) for 'a' .. 'e';
}

$supply.tap({
    say  "Tap 1 got $_";
    sleep 1;
});

$supply.tap({
   say "Tap 2 got $_";
});