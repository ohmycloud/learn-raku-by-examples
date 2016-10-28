#! /usr/bin/env perl6
use v6;

multi merge ([], @ys) { @ys }

multi merge (@xs, []) { @xs }

multi merge ([$x, *@xs], [$y, *@ys]) {
    $x before $y ?? ($x, merge @xs, [$y, @ys])
                 !! ($y, merge [$x, @xs], @ys)
}


multi mergesort ( [] ) {  []  }

multi mergesort ([$x]) { [$x] }

multi mergesort (@xs)  {
    given @xs.elems div 2 -> $middle {
        merge
            mergesort( @xs[ 0 ..^ $middle ] ),
            mergesort( @xs[ $middle .. *  ] )
    }
}


 my @data = 6, 7, 2, 1, 8, 9, 5, 3, 4;
#my @data = < p e r l s i x >;

say "input  = {           @data  }";
say "output = { mergesort(@data) }";


