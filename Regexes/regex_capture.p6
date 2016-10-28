 use v6;
 my $str = 'Germany was reunited on 1990-10-03, peacefully';

 if $str ~~ m/ (\d**4) \- (\d\d) \- (\d\d) / {
 say 'Year: ',"$/[0]";
 say 'Month: ',"$/[1]";
 say 'Day: ',"$/[2]";
 # usage as an array:
 say $/.join('-'); # prints 1990-10-03
 }
