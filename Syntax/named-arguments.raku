multi sub meow($foo, $quz, :$bar) {
    say "$foo is positional and $bar is named, $quz is positional";
}
meow 42, 43, :100bar; # 42 is positional and 100 is named
meow :100bar, 42, 67; # 42 is positional and 100 is named

sub foo (:$bar = 'the default') { say $bar }

foo(:bar("4567"));


multi sub meow (\foo, :$bar is raw) {
    (foo, $bar) = ($bar, foo)
}
my $foo = 42;
my $bar = 100;
meow $foo, :$bar;
say [$foo, $bar];



multi sub meow (:st(:nd(:rd(:$nth))), Positional :list(($, $second, |))) {
    say [$nth, $second];
}
meow :3nth, :list<a b c>;


sub args {
    say "Positional args are: @_.raku()";
    say "Named      args are: %_.perl()";
}

args :foo, :50bar, e => 42;


my @pairs := :42foo, :70meow;
args :foo.Pair, (:50bar), "baz" => "ber", e R=> 42, 42 => 42, |@pairs;

args |(:foo.Pair), |(:50bar),   |("baz" => "ber"),
     |(e R=> 42),  |(42 => 42), |@pairs.Capture;



$bar = Nil;
foo |(:bar($_) with $bar // 998);  # OUTPUT: «the default␤»
$bar = 42;
foo |(:bar($_) with $bar);  # OUTPUT: «42␤» 


my \meows = '🐱';
sub ehh { rand }
say %(
    (meows) => 'moo',
    (ehh)   => 42,
    (τ)     => 'meow',
);