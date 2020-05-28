my regex equation-regex { a '+' b '=' c   }; # whitespace need to explicit write out
my rule  equation-rule  { a '+' b '=' c   }; # implicit whitespace insert into
my rule  equation-rule2 { a '+' b '=' c   }; # implicit whitespace insert into
my token equation-token { a '+' b '=' c   }; # whitespace need to explicit write out

my $str1 = 'a + b = c';
my $str2 = 'a+b=c';

say $str1 ~~ /<equation-regex>/; # Nil
say $str1 ~~ /<equation-rule>/;  # ｢a + b = c｣
say $str1 ~~ /<equation-token>/; # Nil

say '-' x 15;

say $str2 ~~ /<equation-regex>/; # ｢a+b=c｣
say $str2 ~~ /<equation-rule>/;  # ｢a+b=c｣, surprised, but it indeed matched
say so $str2 ~~ &equation-rule;  # ｢a+b=c｣, same
say $str2 ~~ /<equation-token>/; # ｢a+b=c｣
say so $str2 ~~ &equation-rule2;


my token non-space-y { 'once' 'upon' 'a' 'time' }
my rule space-y { 'once' 'upon' 'a' 'time' }
say so 'onceuponatime'    ~~ &non-space-y; # OUTPUT: «True␤»
say so 'once upon a time' ~~ &non-space-y; # OUTPUT: «False␤»
say so 'onceuponatime'    ~~ &space-y;     # OUTPUT: «False␤»
say so 'once upon a time' ~~ &space-y;     # OUTPUT: «True␤»
say so 'onceuponatime'    ~~ /<space-y>/;  # OUTPUT: False
say so 'once upon a time' ~~ /<space-y>/;  # OUTPUT: True


