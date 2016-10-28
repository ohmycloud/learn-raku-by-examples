use v6;
my $str = 'Germany was reunited on 1990-10-03, peacefully';

if $str ~~ m/ (\d**4) \- (\d\d) \- (\d\d) / {
    say $/.WHAT;  # Match
    say $/.elems; # 3
    say 'Year: ',"$/[0]";
    say 'Month: ',"$/[1]";
    say 'Day: ',"$/[2]";
    
    # usage as an array:
    say $/.join('-'); # prints 1990-10-03
}
 
# Year: 1990
# Month: 10
# Day: 03
# 1990-10-03