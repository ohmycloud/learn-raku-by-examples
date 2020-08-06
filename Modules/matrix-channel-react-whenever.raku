#!/usr/bin/env perl6

use Terminal::Print <T>;

T.initialize-screen;
my @chars = '/' .. 'z';
my Channel $matrix .= new;
my @xs = ^T.columns .pick(*).grep({ $_ != 0 && $_ %% 4 }).rotor(2, :partial);
my @sx = ^T.rows .pick(*).grep({ $_ != 0 && $_ %% 3 }).rotor(2, :partial);

while +@xs {
    await do for |@xs.pop -> $y {
        start {
            for 1,2,3 ... * > T.columns -> $x {
                $matrix.send([$x, $y, '-']);
            }
        }
    }
}

await do for 9,18,27 ... * > T.columns -> $x {
    start {
        for 1,2,3 ... * > T.rows -> $y {
            $matrix.send([$x, $y, '|']);
        }
    }
}

react {
    whenever $matrix -> [$x, $y, $z] {
        T.print-cell($x, $y, $z);
    }

    whenever Promise.in(25) {
        T.shutdown-screen;
        done;
    }

    whenever signal(SIGINT) {
        T.shutdown-screen;
        done;
    }
}