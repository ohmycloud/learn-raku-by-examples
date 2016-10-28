# slurp 读入到数组后只是一个元素
my @lines = slurp('3col.txt');
say @lines.elems;

my $fh = open('3col.txt');
for $fh.lines -> $line {
    say $line;
}

