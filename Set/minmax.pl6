my @a = [1,2,3,4,5,6,7,9,10,12];
my $a = @a.minmax;
($_ ∈ @a)?? .say !! "".say for $a.flat;
