#!/usr/bin/env perl6

# 实现从右到左, 横向连续不断的滚动, 第 N 列的字符不断地替换掉第 N-1 列的字符。
#| 可能 https://github.com/vrurg/raku-Vikna 能够实现。
use Terminal::Print <T>;
T.initialize-screen;
my @chars = '一' ... '二';
my Channel $c .= new;
my @columns = T.columns, {$^a - 3} ... * < 0;

await do for @columns -> $x {
    start {
        for 1,3,5 ... * > T.rows -> $y {
            $c.send([$x, $y, @chars.roll]);
        }
    }
}


await do for @columns.sort -> $x {
    start {
        for @columns.sort -> $i {
            state $a = $i;
            state $b = $i;
            start {

                for 1,3,5 ... * > T.rows -> $y {
                    $c.send([$a, $y, ' ']);
                }

                for 1,3,5 ... * > T.rows -> $y {
                    $c.send([$b, $y, @chars.roll]);
                }

                $a += 4;
                $b += 6;
            }

        }
    }
}


react {
    whenever $c -> $v {
        my ($x, $y, $z) = $v[0], $v[1], $v[2];
        sleep 0.001;
        T.print-cell($x, $y, $z);
    }
}

T.shutdown-screen;