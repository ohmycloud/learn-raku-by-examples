#!/usr/bin/env perl6

my $supplier = Supplier.new;
my $supply   = $supplier.Supply;

$supply.tap({
    say  "Tap 1 got $_";
});

$supply.tap({
    say  "Tap 2 got $_";
});

$supplier.emit(10.rand);
$supplier.emit(10.rand + 100);