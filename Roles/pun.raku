role Point {
    has $.x;
    has $.y;
    method abs { sqrt($.x * $.x + $.y * $.y) }
}

my $p = Point.new(x => 6, y => 8);
say $p ~~ Point;


say Point.new(x => 6, y => 8).abs;
