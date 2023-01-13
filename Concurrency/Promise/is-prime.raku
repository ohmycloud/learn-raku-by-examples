my $promise = start {
    my $nth = 0;
    my $nth-prime;
    for 1..* -> $number {
        $nth++ if $number.is-prime;
        if $nth == 10_000 {
            $nth-prime = $number;
            last;
        }
    }
    $nth-prime;
}
await $promise.then({ say .result });