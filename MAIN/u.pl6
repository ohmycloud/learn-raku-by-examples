#!/usr/bin/env perl6

# 1486684800 这个时间戳用网页版检测出来是 2017/2/10 08:00:00, 用该程序检测出来却不对,是 2017-02-10, 只有日期没有小时。

multi sub MAIN(Int \timestamp) {
    sub formatter($_) {
        sprintf '%04d-%02d-%02d %02d:%02d:%02d',
                .year, .month,  .day,
                .hour, .minute, .second,
    }
    given DateTime.new(+timestamp, :&formatter).in-timezone(8*3600) {
        when .Date.DateTime == $_ { say .Date }
        default { .say }
    }
}

multi sub MAIN(Str $date where { try Date.new($_) }, Str $time?) {
    my $d = Date.new($date);
    if $time {
        my ( $hour, $minute, $second ) = $time.split(':');
        say DateTime.new(date => $d, :$hour, :$minute, :$second).posix - 28800;
    }
    else {
        say $d.DateTime.posix - 28800;
    }
}