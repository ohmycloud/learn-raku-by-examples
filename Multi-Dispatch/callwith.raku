proto a(|) { * }

multi a( Any $x ) {
    say "Any $x";
    return 5;
}

multi a( Int $x ) {
    say "Int $x";
    my $res = callwith( $x + 1 );
    say "Back in Int with $res";
}

a 1;

# output:
# Int 1
# Any 2
# Back in Int with 5
