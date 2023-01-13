#!/usr/bin/env raku
use v6.d;

grammar Number {
#    token TOP { <number> }
    token TOP {
        <sign>? [
          | <integer>
          | <floating-point>
        ] <exponent>?
    }

    token sign {
        <[+-]>
    }

    token exp {
        <[eE]>
    }

    token integer {
        \d+
    }

    token floating-point {
        \d* ['.' <integer>]
    }

    token exponent {
        <exp> <sign>? <integer>
    }
}

class NumberActions {
    has $.n = 0;
    has $!sign = 1;
    method TOP($/) {
        my $n = $<integer>.made;
        $n *= $<sign>.made if $<sign>;
        $n *= 10 ** $<exponent>.made if $<exponent>;
        $/.make($n);
    }
    
    method number($/) {
        my $n = $<integer>.made;
        $n *= $<sign>.made if $<sign>;
        $/.make($n);
    }
    
    method integer($/) {
        $/.make(+$/);
    }

    method sign($/) {
        $/.make(~$/ eq '-' ?? -1 !! 1);
    }

    method exponent($/) {
        my $e = $<integer>;
        $e *= -1 if $<sign> && ~$<sign> eq '-';
        $/.make($e);
    }
}

my @cases =
        7, 77, -84, '+7', 0,
        3.14, -2.78, 5.0, '.5',
        '3E4', '-33E55', '3E-3', '-1E-2',
        '', '-', '+';

#`(
for @cases -> $number {
    my $actions = NumberActions.new;
    my $test = Number.parse($number, :$actions);
    if ($test) {
        say "OK $number = {$actions.n}";
    } else {
        say "NOT OK $number";
    }
}
)

my $actions = NumberActions.new;
my $test = Number.parse("-1E-2", :$actions);
dd $test.made;

























