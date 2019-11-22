#!/usr/bin/env perl6

my $supplier = Supplier.new;

$supplier.Supply.tap({
    say $_;
});

$supplier.emit($_) for 'a'..'e';