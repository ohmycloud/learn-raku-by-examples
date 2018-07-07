use v6;

for $=finish.lines -> $line {
    print $line  if $line ~~ m|^'<s>'$| ^ff^ $line ~~ m|^'</s>'$|;
}

=finish
<s>
讲
一个
笑话
</s>
