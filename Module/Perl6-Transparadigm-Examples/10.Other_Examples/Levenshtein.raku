#! /usr/bin/env perl6
use v6;

sub levenshtein_distance ( Str $str1, Str $str2 --> Int ) {
    my @str1 = *, $str1.comb;
    my @str2 = *, $str2.comb;
 
    my @dist;
    @dist[$_][ 0] = $_ for ^@str1.end;
    @dist[ 0][$_] = $_ for ^@str2.end;
 
    for 1..@str1.end  X  1..@str2.end -> $i, $j {
        @dist[$i][$j]
            = @str1[$i] eq @str2[$j]  ??   @dist[$i-1][$j-1]    # No change
                                      !! ( @dist[$i-1][$j  ],   # Deletion
                                           @dist[$i  ][$j-1],   # Insertion
                                           @dist[$i-1][$j-1],   # Substitution
                                         ).min + 1;             #...use cheapest
    }
 
    return @dist[*-1][*-1];
}
 
my @a = ['java fun', 'perl joy'], ['perl six', 'comp sci'];
 
for @a -> [$s, $t] {
    say "levenshtein_distance('$s', '$t') == ", levenshtein_distance($s, $t);
}

