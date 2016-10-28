class Point {
    has $.x;
    has $.y = 2 * $!x;
}

my $p = Point.new( x => 1, y => 2);
say "x: ", $p.x;
say "y: ", $p.y;

my $p2 = Point.new( x => 5 );
# the given value for x is used to calculate the right
# value for y.
say "x: ", $p2.x;
say "y: ", $p2.y;
