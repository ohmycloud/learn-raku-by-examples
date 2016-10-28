use v6;

grammar KeyValuePairs {
    token TOP { 
	    [ <pair> \n+ ]*
	}
	
	token ws { \h* }
	
	rule pair {
	    <key=.identifier> '=' <value=.identifier>
	}
	
	token identifier { \w+ }
}

class KeyValuePairsActions {
    method identifier($/)  { make ~$/                   }
	method pair      ($/)  { make ~$<key> => ~$<value>  }
	method TOP       ($/)  { make $<pair>>>.made        }
}
	
my $string = q:to/EOI/;
second=b
hits=42
perl=6
EOI

my $actions = KeyValuePairsActions.new;
my $match = KeyValuePairs.parse($string, :$actions).made;

for @$match -> $p {
    say "key: $p.key()\tValue: $p.value()";
}
