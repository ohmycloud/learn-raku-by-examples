#!/usr/bin/env perl6

use v6.c;

ROLL:
for 1..10 -> $r {
    given (1..6).roll {
        when 6 {
            say "Roll $r: you win!";
            last ROLL;
        }
        default {
            say "Roll $r: sorry...";
        }
    }
    LAST {
        say "You either won or lost - this runs either way";
    }
}
