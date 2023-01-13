#!/usr/bin/env perl6

use v6;
use fatal;

sub foo( Int @nums ) {
    say @nums.join(" ");
}

sub bar( UInt @nums ) {
    say @nums.join(" ");
}

my UInt @nums = (1, 2);
say "foo: ";
foo(@nums);
say "bar: ";
bar(@nums);
