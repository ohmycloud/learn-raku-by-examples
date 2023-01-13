#| raku datetime-unit.raku
sub MAIN() {
    my $fmt = {sprintf "%04d-%02d-%02d %02d:%02d:%02d", .year, .month, .day, .hour, .minute, .second};

    my @dates = gather given Date.today {
        my $current-datetime = .DateTime;
        while $current-datetime <= .succ.DateTime {
            take $current-datetime;
            $current-datetime = $current-datetime + Duration.new(300.0);
        }
    }

    for @dates.rotor(2 => -1) {
        printf("[%s, %s]\n", .[0].clone(formatter => $fmt), .[1].clone(formatter => $fmt));
    }
}

# [2022-02-14 00:00:00, 2022-02-14 00:05:00]
# [2022-02-14 00:05:00, 2022-02-14 00:10:00]
# [2022-02-14 00:10:00, 2022-02-14 00:15:00]
# ...
# [2022-02-14 23:55:00, 2022-02-15 00:00:00]