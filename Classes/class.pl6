#!/usr/bin/env perl6

use v6;

role with-method {
    method a-method { return "in-a-method of " ~ $?CLASS.^name  };
}

class a-class does with-method {
    method another-method { return 'in-another-method' };
}

class b-class does with-method {};

my $what-class='a-class';

say ::($what-class).a-method;
$what-class = 'b-class';
say ::($what-class).a-method;

my $what-method='a-method';
say a-class."$what-method"();
$what-method='another-method';
say a-class."$what-method"();
