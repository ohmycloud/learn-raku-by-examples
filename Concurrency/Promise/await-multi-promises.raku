my $p1 = start {
    my $sum = 0;
    for 1..10 { $sum += $_ }
    $sum
}

my $p2 = start {
    my $product = 1;
    for 1..10 {
        $product *= $_
    }
    $product
}

my @results = await $p1, $p2;
say @results;