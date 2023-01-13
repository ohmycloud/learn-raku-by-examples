#!/usr/bin/env perl6

use Terminal::Print <T>;

T.initialize-screen;
my @lines = $=finish.lines;
my int $columns = @lines.elems + 85;
my int $lcolumns = 3;
my int $col = -1;

for @lines -> $line {
        my @words = $line.comb;
        my int $row = 5;
        my int $lrow = 20;

        await do for @words -> $word {
            start {
                T.print-cell($columns, $row, $word);
                $row ⚛+= 1;
            }

            start {
                T.print-cell($col ⚛+= 1, 18, '|');
            }
            sleep 0.1;
            start {
                T.print-cell($lcolumns, $lrow, $word);
                $lrow ⚛+= 1;

            }
        }
        $columns ⚛-= 3;
        $lcolumns ⚛+= 3;
}

sleep 10;
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