role Letters {
    token letters { \w+ }
}

role Quote-Quotes {
    token quote { "\""|"`"|"'" }
}

role Quote-Other {
    token quote { "|"|"/"|"¡" }
}

grammar Quoted-Quotes does Letters does Quote-Quotes {
    token TOP { ^  <quoted> $}
    token quoted { <quote>? <letters> <quote>?  } 

}

grammar Quoted-Other does Letters does Quote-Other {
    token TOP { ^  <quoted> $}
    token quoted { <quote>? <letters> <quote>?  } 

}

my $quoted = q{"enhanced"};
my $parsed = Quoted-Quotes.parse($quoted);
say $parsed<quoted>;

$quoted = "|barred|";
$parsed = Quoted-Other.parse($quoted);
say $parsed<quoted>;
