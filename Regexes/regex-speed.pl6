#!/usr/bin/env perl6

use v6;

my @array = "aaaaa" .. "fffff";
my @search = "aaaa" .. "cccc";

say (@array X @search).grep( { defined($^a[0].index($^a[1])) } )
    .grep( { $^a[0].index($^a[1]) == 0 } );
#say @array X @search; 
