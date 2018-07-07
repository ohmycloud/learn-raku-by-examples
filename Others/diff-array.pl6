use v6;

my @a = lines "170.txt".IO;
my @b = lines "171.txt".IO;

my $diff = @a (-) @b;

.say for $diff.keys.sort;
