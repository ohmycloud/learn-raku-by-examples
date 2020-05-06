#!/usr/bin/env perl6
sub MAIN() {
    react {
        whenever $*IN.lines {
            # 给标准输入中的每一个汉字加上一个空格, 保持 1 米距离。
            .join(" ").say with $_.comb(/<:Han> | <:!Han>+/);
        }
    }
}