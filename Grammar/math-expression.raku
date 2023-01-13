#!/usr/bin/env perl6
use lib '.';
use Math::MathExpression;
use Math::MathEvalAction;

my $match = MathExpression.parse(
        '4 + 5 * (1 + 3)',
        actions => MathEvalAction.new,
        );

say $match.made.raku;