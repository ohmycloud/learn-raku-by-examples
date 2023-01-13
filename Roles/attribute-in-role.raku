#!/usr/bin/env perl6

role A {
    has $.x
}

role B does A {
}

class C does B {
    method this() { say $!x }
}

C.new(:x(1)).this;