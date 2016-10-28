use v6;
my %lilei     ='Math'=>98,'Chinese'=>'72','English'=>'128';
my %hanmeimei ='Math'=>98,'Chinese'=>'72','English'=>'128';
say "they have the same course" if %lilei.keys ~~ %hanmeimei.keys;
say 'true' if %lilei{%hanmeimei.keys} ~~ %hanmeimei.values;

my $a = 2
say so $a ~~ 1..3
say so $a ~~ Int
say so  $a ~~ 23
say so $a ~~ {$_.Str ne $_.perl}
say so (1..3).ACCEPTS($a)


