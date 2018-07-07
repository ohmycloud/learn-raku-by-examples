#!/usr/bin/env perl6

use v6;

sub four-bits() is pure {
    say "pure 4 bits";
    return  <0 1> X~  <0 1> X~  <0 1> X~  <0 1>;
}

proto royal-road( Str $bits ) is pure {*}
multi royal-road( "0000" ) is pure { say "pure0000"; return 1; }
multi royal-road( "1111" ) is pure { say "pure1111"; return 1; }
multi royal-road( Str $bits ) is pure { say "purexxxx"; return 0; }

BEGIN { say ‘Begin’ }
say ‘Start’;
say royal-road("1010");
my %royal-road-hash = four-bits().map: { $^þ => royal-road( $^þ ) };

say %royal-road-hash;
