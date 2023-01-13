#!/usr/bin/env perl6

role Canine {
    method run { "In Canine" }
}

class Dog does Canine {
    method run { self.Canine::run }
}

sub MAIN() {
    my $dog = Dog.new();
    say $dog.run;
}