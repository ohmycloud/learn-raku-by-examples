use v6;

my @lines = slurp('3col.txt');
for @lines -> $line {
   my @b = $line.comb(/\d+/);
   say "@b[]";
   say "-" x 45;
}

# 没有打印出满意的结果, 因为 slurp 是把所有文本作为一个字符串吸入的.

#`(
my $fh = open('3col.txt');
my $num;
for $fh.lines -> $line {
    $num += $line.words.[2];
}
say $num;
)

my $fh = open('3col.txt');
# say [+] ($fh.lines>>.words).[2];
my @l = $fh.lines>>.comb(/\d+/);
say @l.elems;