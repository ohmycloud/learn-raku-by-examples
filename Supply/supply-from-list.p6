#!/usr/bin/env perl6

my $supply = Supply.from-list('a' .. 'e');
$supply.tap({
    .say;
});