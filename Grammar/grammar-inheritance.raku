grammar Letters {
    token letters { \w+ }
}

grammar Quote-Quotes {
    token quote { "\""|"`"|"'" }
}

grammar Quote-Other {
    token quote { "|"|"/"|"¡" }
}

grammar Quoted-Quotes is Letters is Quote-Quotes {
    token TOP { ^  <quoted> $}
    token quoted { <quote>? <letters> <quote>?  } 

}

grammar Quoted-Other is Letters is Quote-Other {
    token TOP { ^  <quoted> $}
    token quoted { <quote>? <letters> <quote>?  } 

}

my $quoted = q{"enhanced"};
my $parsed = Quoted-Quotes.parse($quoted);
say $parsed<quoted>;

$quoted = "|barred|";
$parsed = Quoted-Other.parse($quoted);
say $parsed<quoted>;
