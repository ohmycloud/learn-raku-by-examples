#! /usr/bin/env perl6
use v6;

my @values = (1, 1, 3, 4, 4, 4, 4, 5, 5, 5, 7, 7, 12, 12, 1, 7, 7, 99);

say 'mean (a) = ', mean_a(@values);
say 'mean (g) = ', mean_g(@values);
say '    mode = ',   mode(@values);
say '  median = ', median(@values);

sub mean_a (*@list) {
    my $sum = [+] @list;
    return $sum / @list.elems;
}

sub mean_g (*@list) {
    my $product = [*] @list;
    return $product ** (1/@list.elems)
}

sub mode (*@list) {
    my $frequencies = @list.Bag;
    my $list_elems  = $frequencies.pairs;
    my $max_freq    = $frequencies.values.max;
    my @max_vals    = $list_elems.grep({.value == $max_freq});

    return @max_vals».key;
}

sub median (*@list) {
    my @sorted = @list.sort;
    return @sorted.elems %% 2 ?? mean_a(@sorted.[*/2, */2-1])
                              !!        @sorted.[*/2]
}
