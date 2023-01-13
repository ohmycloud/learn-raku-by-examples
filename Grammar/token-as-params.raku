#!/usr/bin/env perl6

my token a { a };
my token quoted(&by) {
    <{ &by }> \d+ <{ &by }>
};

say "a135a" ~~ /<quoted=&quoted(&a)>/;