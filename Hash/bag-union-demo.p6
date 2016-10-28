my $a = bag <a a a b b c>;
my $b = bag <a b b b>;

say $a (|) $b;
say $a (&) $b;
say $a (+) $b;
say $a (.) $b;
