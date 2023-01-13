use v6;
use Grammar::Debugger;
grammar KeyValuePairs {
    token TOP {
        [<pair>]*
    }
    
    token pair {
        <key=.identifier>  \s* '=' \s*  <value=.identifier> \v*
    }
    token identifier {
        \w+
    }
}

class KeyValuePairsActions {
    method identifier($/)  { $/.make: ~$/                          }
    method pair      ($/)  { $/.make: $<key>.made => $<value>.made }
    method TOP       ($/)  { $/.make: $<pair>».made                }
}

my $res = KeyValuePairs.parse(q:to/EOI/, :actions(KeyValuePairsActions)).made;
    second =b
    hits= 42
    perl = 6
    smeil=7
    EOI
for @$res -> $p {
    say "Key: $p.key()\tValue: $p.value()";
}