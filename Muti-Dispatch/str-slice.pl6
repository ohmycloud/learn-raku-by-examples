multi postcircumfix:<[ ]> ( Str:D $s, Int:D $n --> Str ) {
	$s.substr: $n, 1
	}
multi postcircumfix:<[ ]> ( Str:D $s, Range:D $r --> Str ) {
	$s.substr: $r.min, $r.max - $r.min + 1
	}
multi postcircumfix:<[ ]> ( Str:D $s, List:D $i --> List ) {
	map( { $s.substr: $_, 1 }, @$i ).List
	}

my $string = 'The quick, purple butterfly';

{ # Works
my $single = $string[0];
say $single; # T
}

{ # Works
my $substring = $string[5..9];
say $substring; # uick
}

{ # Works
my $substring = $string[1,3,5,7];
say $substring; # (h   u c)
}
