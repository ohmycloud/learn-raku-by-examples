#!/usr/bin/env perl6

my $pause = start {
    put "Promise starting at ", now;
    sleep 5;
    put "Promise ennding at ", now;
}

await $pause;