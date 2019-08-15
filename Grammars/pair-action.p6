use v6;

grammar KeyValuePairs {
    token TOP {
        [<pair> \n+]*
    }
    token ws { \h* }

    rule pair {
        <key=.identifier> '=' <value=.identifier2>
    }
    token identifier {
        \w+
    }
     token identifier2 {
        \w+
    }
}

class KeyValuePairsActions {
    method identifier($/) { $/.make: '[' ~$/ ~ ']'                }
    method identifier2($/) { $/.make: '{' ~$/ ~ '}'                }
    method pair      ($/) { $/.make: $<key>.made => $<value>.made }
    method TOP       ($/) { $/.make: $<pair>».made                }
}

my  $res = KeyValuePairs.parse(q:to/EOI/, :actions(KeyValuePairsActions)).made;
    second=b
    hits=42
    perl=6
    EOI
say $res;
for @$res -> $p {
    say "Key: $p.key()\tValue: $p.value()";
}
