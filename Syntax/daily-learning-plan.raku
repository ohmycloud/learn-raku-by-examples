#| daily learning plan
#| https://github.com/rakudo/rakudo/commit/3445513858
#| unit, 单位, 年、月、日、小时、分钟和秒
#| start, 开始时间; end, 结束时间
#| raku daily-learning-plan.raku --start='2022-02-14' --end='2022-02-15' --unit=1800seconds
#| raku daily-learning-plan.raku --start='2022-02-14' --end='2022-02-15' --unit=5minutes
#| raku daily-learning-plan.raku --start='2022-02-14' --end='2022-02-15' --unit=2hours
sub MAIN(:$start, :$end, :$unit = '5minutes') {
    my @learning = ['学习 Scala', '看一会儿电视剧', '吃饭', '睡觉', '看一会儿书', '学习 Rust', '学习 Java', '学习 Raku', '上网'];
    my $formatter =  { sprintf "%04d-%02d-%02d %02d:%02d:%02d", .year, .month, .day, .hour, .minute, .second };

    my $match = $unit.match(/^(\d+)(\w+)/);
    my $pair = Pair.new($match[1].Str, $match[0].Int);

    my @dates = gather for Date.new($start) ... Date.new($end) -> $d {
        my $start-datetime = DateTime.new($d.Str ~ 'T00:00:00+08:00').truncated-to("day");
        my $end-datetime   = $start-datetime.later(:1day);
        
        .clone(:$formatter).take for $start-datetime, *.later(|$pair) ... * >= $end-datetime;
    }

    
    (.[0].Str ~ q{ } ~ .[1].Str ~ q{ } ~ @learning.pick()).say if .[0] < .[1] for @dates.rotor(2 => -1);
}

# 2022-02-15 23:53:00 2022-02-15 23:54:00 看一会儿书
# 2022-02-15 23:54:00 2022-02-15 23:55:00 吃饭
# 2022-02-15 23:55:00 2022-02-15 23:56:00 上网
# 2022-02-15 23:56:00 2022-02-15 23:57:00 看一会儿电视剧
# 2022-02-15 23:57:00 2022-02-15 23:58:00 睡觉
# 2022-02-15 23:58:00 2022-02-15 23:59:00 上网
# 2022-02-15 23:59:00 2022-02-16 00:00:00 看一会儿书