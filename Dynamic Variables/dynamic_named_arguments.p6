use v6;

multi f(:$named)     { note &?ROUTINE.signature };
multi f(:$also-named){ note &?ROUTINE.signature };

for 'named', 'also-named' -> $n {
	f(|($n => rand))     # «(:$named)␤(:$also-named)␤»
}

my $pair = :named(1);
f |$pair;

my %pairs = also-named => 4;
f |%pairs;
