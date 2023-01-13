#!/usr/bin/env perl6

role R {
    method Str() {'hidden!'}
};

my $i = 2 but R; # $i 现在拥有了 Str 方法
say $i;

sub f(\bound){ put bound };
f($i); # OUTPUT: «hidden!␤»

my @positional := <a b> but R;
say @positional.^name; # OUTPUT: «List+{R}␤»

