#! /usr/bin/env perl6
use v6;

multi quicksort(  []  ) {    };
multi quicksort(  Mu  ) {    };

multi quicksort( [$x] ) { $x };

multi quicksort( [$pivot, *@xs] ) {
    given @xs.classify:{ $^elem before $pivot ?? 'pre' !! 'post'} {
        quicksort( .<pre>  ),
        $pivot,
        quicksort( .<post> );
    }
}

#my @data = 6, 7, 2, 1, 8, 9, 5, 3, 4;
my @data = < p e r l s i x >;

say "input  = {           @data  }";
say "output = { quicksort(@data) }";




















