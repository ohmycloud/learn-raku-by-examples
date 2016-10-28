#!/usr/bin/env perl6

use v6.c;

constant MAX_ROLLS = 10;

ROLL:
for 1..MAX_ROLLS+1 -> $r {
    last ROLL if $r > MAX_ROLLS;

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
        say "You lost, better luck next time!" if $r > MAX_ROLLS;
    }
}
