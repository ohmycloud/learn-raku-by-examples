grammar G {
    rule TOP {^ \d+ $}
}

class A {
    method TOP($/) {say ~$/}
}

G.parse("42", :actions(A));