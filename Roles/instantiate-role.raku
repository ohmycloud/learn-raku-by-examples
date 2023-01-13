#!/usr/bin/env perl6

role Point {
    has $.x;
    has $.y;
    method abs { sqrt($.x * $.x + $.y * $.y) }
    method dimensions { 2 }
}

my $p = Point.new(x => 6, y => 8);
say $p.abs;
say $p; # OUTPUT: «10␤»
say $p.WHAT;  # (Point)
say $p.^name; # Point
say Point.dimensions; # OUTPUT: «2␤»