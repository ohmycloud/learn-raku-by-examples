#| Why not my Hash 
my Hash %hash = abc => 4.5, abd => 5.5, bcd => 6.4, bce => 3.6;
my Map $map = Map.new('abc',1,'abd',2);

dd %hash;
dd $map;
dd $map<>;

if %hash.keys.any».starts-with('ab') {
    say 'ok';
} else {
    say 'no keys starts with "ab" in hash';
}

if $map<>.keys.any».starts-with('ab') {
    say 'ok';
} else {
    say 'no keys starts with "ab" in map';
}


my token filter ($want) { 
    . <?{ $¢.Str ∈ $want }>
}
