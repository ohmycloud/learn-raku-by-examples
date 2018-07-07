use v6;

my @a = "share.txt".IO.lines;

.say for @a.unique;
