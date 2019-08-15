my @a := (1, 2, 3);
say @a.WHAT;
say @a.elems;

my @b = (1, 2, 3);
@b[0] := my $x;
$x = 42;
say @b; 
