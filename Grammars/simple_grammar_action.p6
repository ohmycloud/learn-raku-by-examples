grammar TestGrammar {
    token TOP { ^ \d+ $ }
}

class TestActions {
    method TOP($/) {
        $/.make(2 + ~$/);
    }
}

my $actions = TestActions.new;
my $match = TestGrammar.parse('40', :$actions);
say $match;         # ｢40｣
say $match.made;    # 42
