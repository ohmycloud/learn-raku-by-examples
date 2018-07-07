#!/usr/bin/env perl6

use v6;
my @s := (loop { 42.say }).list;

@s[2]; # says 42 three times 
@s[1]; # does not say anything 
@s[4]; # says 42 two more times 
