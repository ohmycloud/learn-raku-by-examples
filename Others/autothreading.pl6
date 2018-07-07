sub f($x) {
    say $x;
    return $x;
}

say 'OK' if f(1 | 3 | 5) == 3;
say 'Not OK' if f(1 | 3 | 5) != 2;
