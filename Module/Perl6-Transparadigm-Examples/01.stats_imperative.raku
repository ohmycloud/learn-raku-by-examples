#! /usr/bin/env perl6
use v6;

my @values = (1, 1, 3, 4, 4, 4, 4, 5, 5, 5, 7, 7, 12, 12, 1, 7, 7, 99);

say 'mean (a) = ', mean_a(@values);
say 'mean (g) = ', mean_g(@values);
say '    mode = ',   mode(@values);
say '  median = ', median(@values);

sub mean_a (*@list) {
    my $sum;
    for @list -> $elem {
        $sum += $elem;
    }
    return $sum / @list.elems;
}

sub mean_g (*@list) {
    my $product;
    for @list -> $elem {
        $product *= $elem;
    }
    return $product ** (1/@list.elems);
}

sub mode (*@list) {
    my %counts;
    %counts{$_}++ for @list;
    my $max = %counts.values.max;
    return %counts.grep({ .value == $max })».key;
}

sub median (*@list) {
    @list.=sort();

    return @list.elems %% 2
            ?? mean_a( @list[*/2, */2-1] )
            !!         @list[*/2];
}

