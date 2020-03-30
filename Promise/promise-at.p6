#!/usr/bin/env perl6

my $later = Promise.at: now + 7;
$later.then: { put "It's now {now}" };

await $later;