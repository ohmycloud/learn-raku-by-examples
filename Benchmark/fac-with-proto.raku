proto with-proto(Int $n) { 2 * {*} }
multi with-proto(Int $n) { $n + 1 }
sub invoking-nontrivial-proto() {
    for ^10_000_000 {
        with-proto(20)
    }
}