sub MAIN() {
    if 'abc' ~~ /\w/ {
        $/.make: {'a' => 'bc'};
        say $/.made;
    }

    if 'abc' ~~ /\w/ {
        make {'a' => 'bc'};
        say $/.made;
    }
}