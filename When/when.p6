# given 和 when：
# given 接收一个参数和一个 block
# given 把它接收的参数设置为 $_, 然后调用后面的 block
# when 也接收一个参数和一个 block
# when 将 $_ 和 when 接收的参数进行智能匹配
# 如果结果是 True， 则执行代码块
# 然后控制就跳出 when 的包围圈

my $ticks = 0;
given $ticks {
    when 1   {say ""; }
    when 1/2 {say "/"; }
    when Int {say $_.Str; }
    when Rat {say $_.perl; }
    die "Duration must be Int or Rat, but it's { $_.WHAT }";
}

# given 和 when 可以单独使用
# 设置了 $_,  进行一系列操作时，given 比较方便
# 当 $_ 被设置后 ， when 可以用在任何地方
# when 在 for 循环中很方便

my $boring-lines = 0;
for $*IN.lines {
    when /"Lunasa" | "Altan"/ { say "Found band!"; }
    when /"fiddle" | "flute"/ { say "Found instrument!"; }
    $boring-lines++;
}


