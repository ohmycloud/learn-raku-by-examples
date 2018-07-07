#!/usr/bin/env perl6

use v6;

# Semilists are semicolon lists

my %hash = a => {b => 2, c => 4};
say %hash{"a"}{"b"}.perl; # 2
say %hash{"a";"b"}.perl; # (2,) 

my @sliceable = [[ ^10 ], ['a'..'h'], ['Ⅰ'..'Ⅺ']];
say @sliceable[ ^3; 4..6 ];
