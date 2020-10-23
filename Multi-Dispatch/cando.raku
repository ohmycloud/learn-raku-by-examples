proto how-many(|) { * }

multi how-many( Associative $a ) {
    say "Associative $a";
    my $calling = callwith( 1 => $a );
    return $calling;
}

multi how-many( Pair $a ) {
    say "Pair $a";
    return "There is $a";
}

multi how-many( Hash $a ) {
    say "Hash $a";
    return "Hashing $a";
}

my $little-piggy = little => 'piggy';
say $little-piggy.^name; # OUTPUT: Pair
say &how-many.cando( \($little-piggy) );
