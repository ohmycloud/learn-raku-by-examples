#!/usr/bin/env perl6

my @matches = @*ARGS.map( {$^þ ~~ m:g/\* ~ \* (\w+)/} );

say @matches.map: { $^þ.perl ~ "\n" };

my $a-regex = /^þ/;

say 'þor' ~~ $a-regex;

my $ð = 'ð';
my $var-regex = rx/$ð $/;
say 'buð' ~~ $var-regex;

my $d = $ð;
my $no-var-regex = /$d u/;
say 'ðu' ~~ $no-var-regex;

$_ = 'ðu';

say "Matching contextual variable";
say rx/.u/;
say m/ð./;

say "Variable that inmediately matches contextual variable";
my $not-a-var =  m/ð./;
$_ = 'another context';
say $not-a-var;

say "Matching string";
say 'ðu' ~~ rx/.u/;
say 'ðu' ~~ m/ð./;
