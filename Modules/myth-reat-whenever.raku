#!/usr/bin/env perl6

use Terminal::Print <T>;

T.initialize-screen;
my @lines = $=finish.lines;

my Channel $c .= new;

my $left-to-right = start {
    for @lines.kv -> $index, $line {
        await Promise.in(0.02);
        state $col = $index + 10;
        my @words = $line.comb;
        my int $row = 5;
        for @words -> $word {
            $c.send([$col, $row, $word]);
            $row ⚛+= 1;
        }

        $col += 3;
    }
}

my $right-to-left = start {
    for @lines.kv -> $index, $line {
        await Promise.in(0.02);
        state $col = $index + 160;
        my @words = $line.comb;
        my int $row = 5;
        for @words -> $word {
            $c.send([$col, $row, $word]);
            $row ⚛+= 1;
        }

        $col -= 3;
    }
}


react {
    whenever $c.Supply -> [$x, $y, $z] {
        sleep 0.02;
        T.print-cell($x, $y, $z);
    }

    whenever Promise.in(15) {
        for ^T.columns -> $x {
            for ^T.rows -> $y {
                T.print-cell($x, $y, ' ');
            }
        }
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

=finish
　　　　星月神话
我的一生最美好的场景
就是遇见你
在人海茫茫中静静凝望着你
陌生又熟悉
尽管呼吸着同一天空的气息
却无法拥抱到你
如果转换了时空身份和姓名
但愿认得你眼睛
千年之后的你会在哪里
身边有怎样风景
我们的故事并不算美丽
却如此难以忘记
尽管呼吸着同一天空的气息
却无法拥抱到你
如果转换了时空身份和姓名
但愿认得你眼睛
千年之后的你会在哪里
身边有怎样风景
我们的故事并不算美丽
却如此难以忘记
如果当初勇敢的在一起
会不会不同结局
你会不会也有千言万语
埋在沉默的梦里