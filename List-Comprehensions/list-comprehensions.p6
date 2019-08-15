# 解方程

my $n = 20;
my @a = gather for 1..$n -> $x {
         for $x..$n -> $y {
           for $y..$n -> $z {
             take ($x,$y,$z) if $x*$x + $y*$y == $z*$z;
           }
         }
       };
say @a.perl;

# 3 4 5 5 12 13 6 8 10 8 15 17 9 12 15 12 16 20
