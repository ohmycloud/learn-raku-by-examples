#!/usr/bin/env raku
use v6.d;

role Countable {
    multi method count(::?CLASS:D $t: --> Int) {
        say $t.WHAT;
    }
}

role Countable[Str] {
    multi method count(--> Int) {
        self.chars
    }
}

role Countable[Array] {
    multi method count(--> Int) {
        self.elems
    }
}

my $s = "0123456789" does Countable[Str];
my $arr = [1,2,3,4,5,6,7,8,9] does Countable[Array];
say $s.count();
say $arr.count();