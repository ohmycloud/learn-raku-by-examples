#!/usr/bin/env perl6

my $x = 0;
my @p = (
start for ^100 { $x++; sleep rand/10; },
start for ^100 { $x++; sleep rand/10; },
);
await Promise.allof(@p);
say $x;