#!/usr/bin/env perl6

use Colorizable;

my $string = "Hello" but Colorizable;

given $string {
    say .colorize: red;                            # red text
    say .colorize: :fg(red);                       # same as previous
    say .green;                                      # same as previous

    say .colorize: red, blue;                      # red text on blue background
    say .colorize: :fg(red), :bg(blue);            # same as previous
    say .red.on-blue;                              # same as previous

    say .colorize: red, blue, bold;                # bold red text on blue background
    say .colorize: :fg(red), :bg(blue), :mo(bold); # same as previous
    say .red.on-blue.bold;                         # same as previous
}