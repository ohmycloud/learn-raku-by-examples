constant term:<ANSI-SAME-LINE> = "\e[1F\e[0K";

subset Seconds of Numeric;
my regex number { \d+ [ '.' \d+ ]? }

my %unit-multipliers = 'd' => 60*60*24, 'h' => 60*60, 'm' => 60, 's' => 1; # 每天, 每小时, 每分钟, 每秒所对应的秒数

multi sub pretty-print(Seconds $seconds is copy --> Str) {
    my @ret;
    for %unit-multipliers.sort(-*.value) -> (:key($unit), :value($multiplier)) {
        @ret.push: $seconds.Int div $multiplier ~ $unit if $seconds.Int div $multiplier;
        $seconds = $seconds % $multiplier;
    }
    @ret.join: ' ';
}

multi sub MAIN(Seconds $to-wait) {
    MAIN($to-wait ~ 's');
}

# eg： @timicles => [0.5m 10s]
multi sub MAIN(*@timicles where .all ~~ /<number> <[dhms]>/) {
    my Seconds $to-wait = @timicles».\
        split(/<number>/, :v).\
        map(-> [$,Rat(Any) $count, Str(Any) $unit] --> Seconds { %unit-multipliers{$unit} * $count }).\
        sum;

    react {
        whenever Promise.in($to-wait) {
            exit 0;
        }

        whenever signal(SIGINT) {
            exit 1;
        }

        whenever Supply.interval(1) {
            state $count-down = $to-wait;
            say ANSI-SAME-LINE ~ pretty-print($count-down--);
        }
    }
}

sub USAGE {
print Q:c:to/EOH/;
    Usage: {$*PROGRAM-NAME} NUMBER[SUFFIX]…
    Display a countdown for the specified time. Decimal fractions are supported for
    NUMBER and suffixes for [d]ays, [h]ours, [m]inutes or [s]econds are
    recognized. If the countdown is exhausted exit with 0.

    Receiving SIGNIT will interrupt the countdown and result in exitcode 1.
EOH
}