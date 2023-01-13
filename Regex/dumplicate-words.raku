my $s = 'the quick brown fox jumped over the the lazy dog';
if $s ~~ m/ << (\w+) \W+ $0 >> / { # if 不再需要圆括号
    say "Found '$0' twice in a row";
    say "Found '$/[0]' twice in a line" # $/[0]  可以简写为 $0
}
