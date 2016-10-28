#! /usr/bin/env perl6

sub bottles {
    my ($n) = @_;

    return "No more bottles" if $n == 0;
    return  "1 bottle"  if $n == 1;
    return "$n bottles";
}

for (reverse 1..99) {
    say  bottles($_), " of beer on the wall,";
    say  bottles($_), " of beer.";
    say  "Take one down, pass it around:";
    say  bottles($_ - 1), " of beer on the wall.";
    say  "";
}

