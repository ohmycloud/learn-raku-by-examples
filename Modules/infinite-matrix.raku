#!/usr/bin/env perl6

# ABSTRACT: Draw the green falling characters of a Matrix-like screen, from bottom to up

use Terminal::Print <T>;

T.initialize-screen;

my @chars = '一'..'二';
my @columns = ^T.columns;

my @xs = @columns.pick(*).grep({ $_ != 0 && $_ %% 6 }).rotor(6, :partial);
# ((78 42 114 24 102) (96 12 36 126 54) (84 120 48 60 66) (6 108 132 90 30) (72 18))

# This will go away after some upcoming hash work
my %hash-hack = %( char => '', color => '' );

while +@xs {
    my @x-range = |@xs.pop; # (78 72 48 36)
    await do for @x-range -> $x {
        start {
            for 0 ... T.rows -> $y {
                my $string-printed;
                last if ^21 .roll == 11;
                # the `until` statement executes the block as long as the expression is false.
                until ^42 .roll == 0 and $string-printed {
                   # "if not (X)" you may use unless to invert the sense of a conditional statement.
                    unless ^6 .roll == 4 {
                        T.print-cell($x, $y+4, %( char => @chars.roll, color => 'bold black on_green') );
                        $string-printed = True;
                        T.print-cell($x, $y+3, %( char => @chars.roll, color => 'bold green' ) );
                    }
                }
            }
        }
    }
}

T.shutdown-screen;
