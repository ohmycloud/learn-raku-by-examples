grammar Calculator {
    token TOP { [ <add> | <sub> ] }
    rule  add { <num> '+' <num> }
    rule  sub { <num> '-' <num> }
    token num { \d+ }
}

class Calculations {
    method ws($) {}
    method FALLBACK($token, $match-data) {
        $match-data.make( [~] $match-data.chunks.map: {
            $_.value.?made // $_.value;
        } );
    }
}

say Calculator.parse('2 + 3', actions => Calculations).made;
