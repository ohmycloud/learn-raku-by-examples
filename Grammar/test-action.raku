#!/usr/bin/env perl6

grammar TestGrammar {
    token TOP { \d+ }
}

class TestActions {
    method TOP($/) {
        $/.make(2 + $/);
    }
}

my $match = TestGrammar.parse('40', actions => TestActions.new);
say $match;         # OUTPUT: «｢40｣␤»
say $match.raku;    # OUTPUT: Match.new(:orig("40"), :from(0), :pos(2), :made(42))
say $match.made;    # OUTPUT: 42