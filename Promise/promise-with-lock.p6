#!/usr/bin/env perl6

my $x = 0;
my $lock = Lock.new;
my @p = (
start for ^100 { $lock.lock; $x++; $lock.unlock; sleep rand/10; },
start for ^100 { $lock.protect: { $x++ }; sleep rand/10; }
);
await Promise.allof(@p);
say $x;