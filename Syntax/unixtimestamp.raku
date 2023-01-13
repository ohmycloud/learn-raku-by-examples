#!/usr/bin/env raku

multi sub MAIN(Int \timestamp) {
    sub formatter($_) {
        sprintf '%04d-%02d-%02d %02d:%02d:%02d',
                .year, .month,  .day,
                .hour, .minute, .second,
    }
    given DateTime.new(+timestamp, :&formatter).in-timezone(8 * 3600) {
        when .Date.DateTime == $_ { say .Date }
        default { .say }
    }
}

multi sub MAIN(Str $date where { try Date.new($_) }, Str $time?) {
    my $d = Date.new($date);
    if $time {
        my ( $hour, $minute, $second ) = $time.split(':');
        say DateTime.new(date => $d, :$hour, :$minute, :$second).posix - 8 * 3600;
    }
    else {
        say $d.DateTime.posix - 8 * 3600;
    }
}