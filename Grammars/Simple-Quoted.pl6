grammar Simple-Quoted {
    token TOP { ^  <quoted> $}
    token quoted { <quote>? <letters> <quote>?  } 
    token quote { "*"|"`" }
    token letters { \w+ }
}

my $quoted = "*enhanced`";
my $parsed = Simple-Quoted.parse($quoted);
say $parsed.hash;

