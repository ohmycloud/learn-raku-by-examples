use v6;

my @a = <王 孙 曾>;
my @b = <伟 亦 小>;
my @c = <霆 哲 贤>;
for zip(@a;@b;@c) -> $a,$b,$c {
    say "$a$b$c";
}
