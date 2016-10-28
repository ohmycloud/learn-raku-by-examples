use v6;

grammar TestGrammar {
    token TOP   { ^ <digit> $ }
	token digit { \d+         }
}

class TestActions {
    method TOP($/) {
	   # $/.make( 2 + ~$/);
	   make +$<digit> + 2 ;
	}
}

my $actions = TestActions.new;
my $match   = TestGrammar.parse('40', :$actions);
say $match;
say $match.made; 