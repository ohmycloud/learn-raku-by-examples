#!/usr/bin/env perl6

use Terminal::Print <T>;
T.initialize-screen;
my @chars = '一'..'二';

my $matrix-generator = supply {
    #my @xs = ^T.columns .pick(*).grep({ $_ != 0 && $_ %% 6 }).rotor(5, :partial);
    my @xs = ^T.columns .pick(*).grep(* %% 6).rotor(5, :partial);

    while +@xs {
        for |@xs.pop -> $x {
            for 1...^T.rows -> $y {
                sleep 0.02;
                emit [$x, $y];
            }
        }
    }
}

react {
    whenever $matrix-generator -> $v {
        T.print-cell($v[0], $v[1],@chars.roll);
    }

    whenever Promise.in(20) {
        T.shutdown-screen;
        done;
    }

    whenever signal(SIGINT) {
        T.shutdown-screen;
        done;
    }
}