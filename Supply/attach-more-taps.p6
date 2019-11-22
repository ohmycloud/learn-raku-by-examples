#!/usr/bin/env perl6

my $supply = Supply.interval(0.3);
my $filtered = $supply.grep(* %% 2);

$supply.tap({
    "未过滤的 tap 获得了 $_".say;
});

$filtered.tap({
   "过滤的 tap1 获得了 $_".say;
});

$filtered.tap({
    "过滤的 tap2 获得了 $_".say;
});

sleep 3;