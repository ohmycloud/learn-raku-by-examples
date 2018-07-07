# my $n = 20;
# my @a = gather for 1..$n -> $x {
#          for $x..$n -> $y {
#            for $y..$n -> $z {
#              take $x,$y,$z if $x² + $y² == $z²;
#            }
#          }
#        };
# .say for @a;

my @a = 1..20;
my @c = gather for @a.combinations(3)».permutations {
     #{ for .Array {.say if .[0]*.[0] + .[1]*.[1] == .[2] * .[2] } }
    take .[0], .[1], .[2] if .[0]² + .[1]² == .[2]² for .Array;
}

say @c;