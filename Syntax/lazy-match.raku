my $a = '1B3D4';

my \ll := gather $a ~~ m:g/
      [ <alpha> && { take $/<alpha>.Str } ]
    | [ <digit> && { take $/.<digit>.Numeric } ]
    | [ { say 'step' } ]
/;
say ll[0];
say ll[3];

say ll;