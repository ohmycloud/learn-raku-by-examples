#!/usr/bin/env perl6

use v6;

my @endings = <a b c> ;

my $one-ending = @endings.join("|");
say $one-ending;

my $ending-rx = rx:i/ <$one-ending> $ /;

say $ending-rx;

say "acaba" ~~ $ending-rx;
say "acabó" ~~ $ending-rx;
say "cuac" ~~ $ending-rx;
