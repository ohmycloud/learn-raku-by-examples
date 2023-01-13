#!/usr/bin/env perl6

use Terminal::Print <T>;

T.initialize-screen;
my @chars = '一'..'二';
my Channel $matrix .= new;
my @xs = ^T.columns .pick(*).grep({ $_ != 0 && $_ %% 6 }).rotor(5, :partial);

while +@xs {
    await do for |@xs.pop -> $x {
        start {
            for T.rows ... 1 -> $y {
                sleep 0.01;
                $matrix.send([$x, $y]);
            }
        }
    }
}

react {
    whenever $matrix -> $v {
        sleep 0.01;
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