#!/usr/bin/env raku
use v6.d;

grammar G {
    token TOP {
        # 这里用上了带参数的 token, 因为 tab-indent 实际上是方法, 它接收一个参数
        <tab-indent(2)> $<rest> = .*
    }

    token tab-indent(Int $level) {
        :my $*LEVEL = $level; # has to be in this scope, not in a block
        \t ** {$level}
    }
}

class A {
    method tab-indent($/) {
        say '$*LEVEL = ', $*LEVEL;
    }
}

my $actions = A.new;
say G.parse( "\t\t\t", :$actions );