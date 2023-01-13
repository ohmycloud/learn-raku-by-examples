#!/usr/bin/env perl6

use v6;

my @functions = ( { $^þ / 2}, { $^þ / 3 } );

say @functions.map( { $^þ(33).is-prime } );
say @functions.map: { $^þ(33).is-prime } ;

my @numbers = (33, 77, 49, 11, 34);

say @numbers.map: { .is-prime };
say @numbers.map: *.is-prime;
say @numbers.map: {$^þ.is-prime};
say @numbers.map( *.is-prime );
say map  *.is-prime, @numbers  ;
say map(  { .is-prime}, @numbers ) ;

my $fh = '/tmp/log.txt'.IO.open: :w;
say $fh: "bar";
say '/tmp/log.txt'.IO.slurp
