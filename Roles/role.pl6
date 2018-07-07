#!/usr/bin/env perl6

use v6;

class my-class {
    has $.dash-attribute is rw;

    submethod BUILD(*%args) {
	for %args.kv -> $k, $value {
	    self."$k"( $value );
	}
    }
};

my $my-instance = my-class.new( dash-attribute => 'This is the attribute' );

say $my-instance.dash-attribute;
