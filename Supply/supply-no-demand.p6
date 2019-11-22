#!/usr/bin/env perl6

supply {
    for 'a' .. 'e' {
        emit($_);
        say "Emitted $_";
    }
}
sleep 2;