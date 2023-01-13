#!/usr/bin/env perl6

# ABSTRACT: Draw the green falling characters of a Matrix-like screen, from left to right

use v6;
use Terminal::Print <T>;

T.initialize-screen;

my @chars = '一'..'二';
my @rows = ^T.rows;

my @xs = @rows.pick(*).grep(* % 2).rotor(2, :partial);

# This will go away after some upcoming hash work
my %hash-hack = %( char => '', color => '' );

while +@xs {
    my @x-range = |@xs.pop; # (78 72 48 36)
    await do for @x-range -> $y {
        start {
            for T.columns, {$^a - 3} ... * < 3 -> $x {
                my $string-printed;
                last if ^32 .roll == 11;
                # the `until` statement executes the block as long as the expression is false.
                until ^42 .roll == 0 and $string-printed {
                    # "if not (X)" you may use unless to invert the sense of a conditional statement.
                    unless ^160 .roll == 4 {
                        T.print-cell($x, $y, %( char => @chars.roll, color => 'bold black on_green') );
                        $string-printed = True;
                        T.print-cell($x, $y, %( char => @chars.roll, color => 'bold green' ) );
                    }
                }
            }
        }
    }
}

T.shutdown-screen;
