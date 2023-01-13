sub MAIN() {
    my constant %week = 1..7  Z=> <Mo Tu We Th Fr Sa Su>;
    my constant %month = 1..12 Z=> <一月 二月 三月 四月 五月 六月 七月 八月 九月 十月 十一月 十二月>;
    
    my $today = Date.today;
    my $first-day-of-week = $today.first-date-in-month.day-of-week;
    my $padding = $first-day-of-week == 7 ?? 0 !! $first-day-of-week;
    my $indice-of-first-line = $first-day-of-week == 7 ?? 7 !! 7 - $first-day-of-week;
    
    my @days-in-month = gather take .day for $today.first-date-in-month ... $today.last-date-in-month;
    
    # 第一行补空白
    my @first-line = |(" " xx $padding), |@days-in-month[0..^$indice-of-first-line];
    
    # 剩下的日期
    my $remainder-days = @days-in-month.elems - @days-in-month[0..^$indice-of-first-line].elems;
    my $whole = $remainder-days div 7;
    my $tail = $remainder-days mod 7;
    
    my @days = |@first-line, |@days-in-month[$indice-of-first-line..*];
    
    my $header = 'Mo Tu We Th Fr Sa Su';
    say $header;

    sprintf("%{$header.chars}s", .Str).say for @days.rotor(@first-line.elems, |(7 xx $whole), $tail);

    say ^92 .rotor(
        (0.2, 0.4 ... 3).map: (10 * *.sin).Int
    ).join: "\n";
}