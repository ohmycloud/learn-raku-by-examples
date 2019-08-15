use v6;

multi  limit-lines (Str $s, Int:D $limit) {
    my @lines = $s.lines;
    @lines[0 ..^ min @lines.elems, $limit].join("\n");
}

multi limit-lines (Str $s, Int:U $) {$s}
say (limit-lines "a \n b \n c \n d \n", 3).perl;
# say limit-lines Str, 3;
# say limit-lines "a \n b", Int;
say limit-lines "a \n b \n c", Int;


sub f(::T $p1, T $p2, ::C) {
    # $p1 和 $p2 的类型都为 T, 但是我们还不知道具体类型是什么
    # C 将会保存一个源于类型对象或值的类型
    my C $closure = $p1 / $p2;
    return sub (T $p1) {
        $closure * $p1;
    }
}

# 第一个参数是 Int 类型, 所以第二个参数也是
# 我们从调用用于 &f 中的操作符导出第三个类型
my &s = f(10,2, Int.new / Int.new);
say s(2);  # 10 / 2 * 2  == 10

say 'x' x 55;

multi ff(:$named) { note &?ROUTINE.signature }
multi ff(:$also-named) { note &?ROUTINE.signature }

for 'named', 'also-named' -> $n {
    ff(|($n => rand));      # «(:$named)␤(:$also-named)␤»
}
