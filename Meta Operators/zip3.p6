use v6;

my @a = <王 孙 刘>;
my @b = <伟 亦 百>;
my @c = <霆 哲 爽>;
for zip(@a;@b;@c) -> $a,$b,$c {
    say "$a$b$c";
}
