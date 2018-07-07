# We tap a Supply to start the flow of values, providing a handler
my $ticks = Supply.interval(0.5);
my $tap = $ticks.tap: {
    say now;
}
sleep 3;
$tap.close;
