use v6;
# Twigils影响变量的作用域。请记住, twigils 对基本的魔符插值没有影响，那就是:
# 如果  $a 内插， $^a, $*a, $=a, $?a, $.a, 等等也会内插. 它仅仅取决于 $.
 
    my $lexical   = 1;
    my $*dynamic1 = 10;
    my $*dynamic2 = 100;

    sub say-all() {
        say "$lexical, $*dynamic1, $*dynamic2";
    }

    # prints 1, 10, 100
    say-all();

    {
        my $lexical   = 2;
        my $*dynamic1 = 11;
        $*dynamic2    = 101;

        # prints 1, 11, 101 ,why 2, 11 ,101?
        # $lexical isn't looked up in the caller's scope but in the scope &say-all was defined in.
        # The two dynamic variables are looked up in the callers scope and therefore have the values 11 and 101.
        # 翻译过来就是, $lexical 不是在调用者的作用域内被查找, 而是在 &say-all 被定义的作用域那儿
        # 也就是第一行的 $lexical = 1 了. 另外两个动态作用域变量在调用者的作用域内被查找, 所以值为 11 和 101 
        say-all();
    }

    # prints 1, 10, 101
    say-all();
