#!/usr/bin/env perl6

#| https://stackoverflow.com/questions/54160761/can-roles-access-included-role-attributes
role A {
    has $.x
}

role B does A {
    #method this() { $!x } # not work
    method this() { self.x } # works
}

class C does B {}

say C.new(:x(1)).this;