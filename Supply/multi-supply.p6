#!/usr/bin/env perl6

#| https://stackoverflow.com/questions/57486372/concurrency-react-ing-to-more-than-one-supply-at-a-time
my $i = 0;
my $supply1 = supply { loop { await Promise.in(3); done if $i++ > 5; emit("B"); } }
my $supply2 = supply { loop { await Promise.in(1); done if $i++ > 5; emit("A"); } }

react {
    #whenever Supply.merge($supply1, $supply2) -> $x { $x.print }
    whenever $supply1 -> $x { $x.print };
    whenever $supply2 -> $x { $x.print };
}

## Output: BABABA
## 问题: 为什么输出是 BABABA 而不是 AAABAA 或 AABAAAB 呢
## 答案: 当我们订阅 `supply` 块儿的时候, `supply` 块儿的主体(`body`)就会立即按顺序运行, 以设置订阅。
##       这部分还没有并发, 如果我们想要并发, 我们必须要求它。