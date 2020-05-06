#!/usr/bin/env perl6

my $promise = start { die 'bad stuff' }
sleep 1;
say 'something';
await $promise;
CATCH {
    default {
        say "ERROR: $_.message()";
    }
}