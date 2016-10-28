use v6;

my @original = [1,2],[3,4];
say @original.perl;
my $copy = @original[0]; # $copy points to [1,2]
say $copy;
@original[0][0] = 'fresh stuff'; # $copy[0] holds still 1
say @original;
say $copy;
