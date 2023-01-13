#!/usr/bin/env perl6

my $supplier = Supplier.new;

$supplier.Supply.tap({
    .say;
});

$supplier.emit($_) for 'aa' .. 'zz';