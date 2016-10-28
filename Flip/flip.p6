use v6;

## 使用 flip 貌似实现不了, 捕获的变量取不到。 
my @lines = "input.txt".IO.lines;

my regex number    { \d+ }
my regex uppercase { \w+ }

my $a;
for @lines -> $line {
    if $a = $line ~~ m/^ '>'seq '-' <number> (\w+) $/ ^fff $line ~~ m/^ (\w+) $/ {
        #say $line;
        say $a;
    }
}

=finish
我现在想要将同类的序列（字符串）进行合并，比如有这样一个文件：
>seq-1A
GACACAGTCACCCGAGCCT
>seq-1B
TCAATCAATACTGAAGCGA
>seq-1C
AAAACTAGTCGAGAAGAGAG
>seq-1D
CGTGGAAAACTCCAG
>seq-2A
TAAAAGGCGTTCATTGGATATTTC
>seq-2B
ACTGGCAGTGCATCC

我想要进行合并 得到这样的结果：
>seq-1
GACACAGTCACCCGAGCCTTCAATCAATACTGAAGCGAAAAACTAGTCGAGAAGAGAGCGTGGAAAACTCCAG
>seq-2
TAAAAGGCGTTCATTGGATATTTCACTGGCAGTGCATCC
