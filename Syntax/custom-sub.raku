multi sub smart-join(&separators, *@l --> Str:D) {
    my $ret;

    while @l {
        $ret ~= @l.shift;
        $ret ~= separators if +@l;
    }

    $ret
}

1900..2100
==> grep({ Date.new(.Int, 1, 1).day-of-week | Date.new(.Int, 12, 31).day-of-week == 4 })
==> smart-join({ ++$ %% 8 ?? $?NL !! ' '})
==> say();

say (1900..2100).grep({ Date.new(.Int, 1, 1).day-of-week | Date.new(.Int, 12, 31).day-of-week == 4 }).batch(8)».join(' ').join("\n")