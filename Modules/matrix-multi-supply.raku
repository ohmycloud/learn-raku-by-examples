#!/usr/bin/env perl6

use Terminal::Print <T>;

T.initialize-screen;
my @chars = '一'..'二';
my @columns = ^T.columns;

my @xs = @columns[0..*/2].pick(*).grep({ $_ != 0 && $_ %% 6 }).rotor(3, :partial);
my @top-bottom = @columns[*/2 ^.. *].pick(*).grep({ $_ != 0 && $_ %% 6 }).rotor(4, :partial);
my Channel $c .= new;

my $top-to-bottom-supply = start {
    while +@xs {
        my @x-range = |@xs.pop;
        await do for @x-range -> $x {
            start {
                for 1 ... T.rows  -> $y {
                    $c.send([$x, $y]);
                    last if ^21 .roll == 11;
                }
            }
        }
    }
}

my $bottom-to-top-supply = start {
    while +@top-bottom {
        my @x-range = |@top-bottom.pop;
        await do for @x-range -> $x {
            start {
                for T.rows ... 1 -> $y {
                    $c.send([$x, $y]);
                    last if ^21 .roll == 11;
                }
            }
        }
    }
}

react {
    whenever $c.Supply -> [$x, $y] {
        sleep 0.02;
        T.print-cell($x, $y, %( char => @chars.roll, color => 'bold black on_green') );
        T.print-cell($x, $y, %( char => @chars.roll, color => 'bold green' ) );
    }

    whenever Promise.in(20) {
        $c.close;
        done;
    }

    whenever signal(SIGINT) {
        T.shutdown-screen;
        $c.close;
        done;
    }
}

T.shutdown-screen;