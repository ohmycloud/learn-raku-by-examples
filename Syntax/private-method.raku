#!/usr/bin/env perl6

class Foo {
    has %!table;

    method bar($x) {
        say "bar $x";
    }

    method qux($user) {
        %!table{$user}:exists ^ True
    }

    method expand($expr) {
        my $dog = self.qux($expr);
        say $dog;
        say $dog.WHAT;
        self.bar($dog);
    }
}

my $foo = Foo.new;
$foo.expand(32);