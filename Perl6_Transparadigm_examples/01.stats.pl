#! /usr/bin/env perl6
use v6;

my @values = (1, 1, 3, 4, 4, 4, 4, 5, 5, 5, 7, 7, 12, 12, 1, 7, 7, 99);

say 'mean (a) = ', mean_a(@values);
say 'mean (g) = ', mean_g(@values);
say '    mode = ',   mode(@values);
say '  median = ', median(@values);

sub mean_a (*@list) {
    ([+] @list) / @list.elems;
}

sub mean_g (*@list) {
    ([*] @list) ** (1/@list.elems);
}

sub mode (*@list) {
    given @list.Bag {
        .pairs.grep({$^elem.value == .values.max})».key;
    }
}

sub median (*@list) {
    given @list.sort {
        .elems %% 2
            ?? mean_a( .[*/2-1, */2] )
            !!         .[*/2];
    }
}
