use v6;

my $original = 5;say $original;
my $mirror;
$original := $mirror;       # normal binding, done on runtime

say $mirror;

$original ::= $mirror;      # same thing, but done during compile time
say $mirror;
$original = 3;
say $mirror;                # prints 3
$original =:= $mirror;       # true, because their bound together
$original === $mirror;       # alsotrue, because content and type are equal
