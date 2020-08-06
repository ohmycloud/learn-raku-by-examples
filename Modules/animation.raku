#!/usr/bin/env perl6

# 实现从又到左, 横向连续不断的滚动, 第 N 列的字符不断地替换掉第 N-1 列的字符。
#| 可能 https://github.com/vrurg/raku-Vikna 能够实现。
use Terminal::Print <T>;
T.initialize-screen;
my @chars = '一' ... '二';
my Channel $c .= new;

await do for T.columns, {$^a - 3} ... * < 0 -> $x {
    start {
        for 1,3,5 ... * > T.rows -> $y {
            $c.send([$x, $y]);
        }
    }
}


await do for 1, 4, 7 ... * > T.columns -> $x {
    start {
        for 1,3,5 ... * > T.rows -> $y {
            $c.send([$x+1, $y]);
        }
    }
}

react {
    whenever $c -> $v {
        #sleep 0.02;
        T.print-cell($v[0], $v[1], @chars.roll);
    }
}



T.shutdown-screen;