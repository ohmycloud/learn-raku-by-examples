#!/usr/bin/env perl6

my ($n) := "abc123" ~~ /(<[1..4]>+)$/;
say $n.WHAT;
say $n;

# extracting multiple parts of the match
my ($str, $num) := "abc123" ~~ /(<[a..z]>+)(<[1..4]>+)$/;
say $str;
say $num;

# use coercion in the destructuring
my (Int() $number) := "abc123" ~~ /(<[1..4]>+)$/;
say $number.WHAT;
say $number;

# work with named matches
my (:$alpha, :$digit) := "abc123" ~~ /$<alpha>=(<[a..z]>+) $<digit>=(<[1..4]>+)$/;
say $alpha;
say $digit;

# combined destructuring with if
if "abc123" ~~ /(<[a..z]>+)(<[1..4]>+)$/ -> ($s, $n) {
    say $s;
    say $n;
}