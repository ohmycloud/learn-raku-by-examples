my $s = Supply.from-list(0 .. 5); # 创建一个 on-demand supply
my Tap $t = $s.tap(
    -> $v { say $v }, 
    done => { say "no more ticks" },
    tap => { say "begin tap" }
    );


# 按需供应还可以通过 supply 关键字来创建
# } 后面为什么没有分号, 是因为编译器会自动插入分号
my $supply = supply {
    for 1 .. 10 {
        emit($_);
    }
}

# 多个订阅
$supply.tap( -> $v { say $v });
$supply.tap( -> $v { say $v * $v });