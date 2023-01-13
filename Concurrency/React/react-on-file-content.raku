sub MAIN(:$file) {
    my $f = lazy $file.IO.lines;
    my $iterator = $f.iterator;
    my $i = (1..3).iterator;

    react {
        #| 从列表中创建按需供应, 耗尽后退出
        # whenever Supply.from-list($f) -> $v {
        #     say $v;
        # }

        #| 定时从迭代器中拉取数据, 耗尽后退出
        #| https://docs.raku.org/type/Iterator#index-entry-IterationEnd
        whenever Supply.interval(0.01) {
            my $line := $iterator.pull-one;
            if $line =:= IterationEnd {
                done;
            } else {
                say $line;
            }
        }
    }
}