#!/usr/bin/env perl6

#`(
Write a script that accepts list of positive numbers (@L) and two positive numbers $X and $Y.

The script should print all possible numbers made by concatenating the numbers from @L, whose length is exactly $X but value is less than $Y.

Example
Input:

@L = (0, 1, 2, 5);
$X = 2;
$Y = 21;
Output:

10, 11, 12, 15, 20
)

sub find-number(Str $l, Int $x, Int $y) {
    my @nums = $l.split(',')».Int;
    my @L = (@nums xx 2).flat;

    my @result = gather for @L.combinations($x)».permutations -> $s {
        for $s.cache {
            next if .join() ~~ /^0/;
            .join.Int.take if .join.Int < $y;
        }
    }

    say @result.unique.sort;
}

find-number('0,1,2,5', 2, 21);