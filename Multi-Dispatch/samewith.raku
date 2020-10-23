proto a(|) { * }

multi a( Int $x ) {
    return 1 unless $x > 1;
    return $x * samewith( $x - 1 );
}

say (a 10);
