#!/usr/bin/env perl6

multi sub MAIN(
        :@values where .all ~~ Int;
               ) {
    .put for @values;
               }

#`(
raku array_parameter.p6 --values=1 --values=2 --values=3
1
2
3
)