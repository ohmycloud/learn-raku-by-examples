use lib '.';
use Lang::Grammar;
use Lang::Actions;

my $parsed = Lang::Grammar.parsefile(@*ARGS[0] // 'data/calc.lang', :actions(Lang::Actions.new()));
say $parsed;