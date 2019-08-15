#!/usr/bin/env perl6

use v6;

proto mνlti(|) {*};

multi mνlti(1) { "Yep"};
multi mνlti(2) { "Nay"};
multi mνlti(Int $) { "Welll.."};

say mνlti($_) for ^10;
