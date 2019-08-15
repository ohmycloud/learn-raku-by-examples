use v6;
say $*IN.perl;
say $*IN.path;
say $*IN.chomp;

for $*IN.lines -> $line {
    say "$line";
}
