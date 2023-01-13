#!/usr/bin/env perl6

use Terminal::Print <T>;

T.initialize-screen;
my @chars = '一'..'二';
my @columns = ^T.columns;

my @xs = @columns[0..*/2].pick(*).grep({ $_ != 0 && $_ %% 6 }).rotor(2, :partial);
my @top-bottom = @columns[*/2 ^.. *].pick(*).grep({ $_ != 0 && $_ %% 6 }).rotor(2, :partial);
my Channel $c .= new;

my $top-to-bottom-supply = start {
    while +@xs {
        await Promise.in(0.25);
        my @x-range = |@xs.pop;
        for @x-range -> $x {
                for T.rows ... 1 -> $y {
                    $c.send([$x, $y]);
                }
        }
    }
}

my $bottom-to-top-supply = start {
    while +@top-bottom {
        await Promise.in(0.05);
        my @x-range = |@top-bottom.pop;
        for @x-range -> $x {
                for 1 ... T.rows -> $y {
                    $c.send([$x, $y]);
                }
        }
    }
}

react {
    whenever $c.Supply -> $v {
        sleep 0.01;
        T.print-cell($v[0], $v[1], @chars.roll);
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