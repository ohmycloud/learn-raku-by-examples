#!/usr/bin/env perl6

use Terminal::Print <T>;

T.initialize-screen;

my @chars = '一'..'二';
my @columns = ^T.columns;

my @xs = @columns.pick(*).grep({ $_ != 0 && $_ %% 6 }).rotor(5, :partial);
my @top-bottom = @columns.pick(*).grep({ $_ != 0 && $_ %% 9 }).rotor(3, :partial);

# This will go away after some upcoming hash work
my %hash-hack = %( char => '', color => '' );

while all(+@xs, +@top-bottom) {
    my @x-range = |@xs.pop;
    await do for @x-range -> $x {
        start {
            for T.rows ... 0 -> $y {
                my $string-printed;
                last if ^21 .roll == 11;
                until ^42 .roll == 0 and $string-printed {
                    unless ^6 .roll == 4 {
                        T.print-cell($x, $y, %( char => @chars.roll, color => 'bold black on_green') );
                        $string-printed = True;
                        T.print-cell($x, $y, %( char => @chars.roll, color => 'bold green' ) );
                    }
                }
            }
        }
    }

    my @t-range = |@top-bottom.pop;
    await do for @t-range -> $x {
        start {
            for 1 ... T.rows -> $y {
                my $string-printed;
                #last if ^12 .roll == 11;
                until ^21 .roll == 0 and $string-printed {
                    unless ^6 .roll == 4 {
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
