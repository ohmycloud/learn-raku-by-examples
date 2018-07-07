my $start = now;

# Promise to calculate in chunks
$start = now;
my @p = (1..4).map( -> $t {
    start {
        my $total = 0;
        for (250_000*($t-1)+1)..(250_000*$t) -> \num {
            $total += 1e0/num;
        }
        $total;
    }
});
say (await @p).sum;
say (now - $start);

# Race to calculate in chunks
$start = now;
say (1..1_000_000).race(:batch(250_000)).map(1e0/*).sum;
say (now - $start);