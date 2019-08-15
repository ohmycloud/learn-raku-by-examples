my rule equation { a '+' b '=' c   };
my rule words    { 'rakudo' 'star' };

say so 'a + b = c'   ~~ /<equation>/; # True
say so 'a+b=c'       ~~ /<equation>/; # True
say so 'a +b=c'      ~~ /<equation>/; # True
say so 'a+ b=c'      ~~ /<equation>/; # True
say so 'a + b=c'     ~~ /<equation>/; # True
say so 'rakudo star' ~~ /<words>/;    # True
say so 'rakudostar'  ~~ /<words>/;    # False

#`( 你一定很好奇, 为什么针对 equation 的匹配, 结果都为 True, 你想说这违背直觉! 上面有几个等式明显和规则里面的空格数量对不上啊。
    为什么像 a + b = c 这样的正则匹配, 不论 + 或 = 号周围是否有空格, 都会匹配成功呢?
    如果你用 Comma 编辑器, 你就会看到 rule 中凡是有空格的地方, 都会显示出俩个灰色的圆点, 你把鼠标移上去就会显示: Implicit <.ws> call
    原因就在于隐式的 <.ws> 调用。ws 的定义是这样的: 
        regex ws { <!ww> \s* }
    我们知道这又跟 <ww> 有关系, <ww> 意为 Within word, 是零宽断言, 并不真的匹配字符。
    而 <!ww> 意为 Not within word, 也是零宽断言, 它只匹配位置, 并不消耗字符。官网上有个例子: 以输入字符串 "two words~!" 为例, ⏏ 表示 <!ww> 匹配的位置:
        "⏏two⏏ ⏏words⏏~⏏!⏏"
    与之相反, <?ww> 表示 Within word, 以输入字符串 "two words~!" 为例, ⏏ 表示 <?ww> 匹配的位置:
        "t⏏w⏏o w⏏o⏏r⏏d⏏s~!"    
    所以, regex ws { <!ww> \s* } 的描述如下:
        regex ws {
            <!ww> # only match when not within a word
            \s*   # match zero+ whitespace 
        }

    在上面的 a + b = c 及其变体的匹配中, <!ww> 匹配一个非单词内的位置:
        a + b = c  ⏏a⏏ + ⏏b⏏ = ⏏c⏏
        a+b=c      ⏏a⏏+⏏b⏏=⏏c⏏ 
        a +b=c     ⏏a⏏ +⏏b⏏=c⏏
        a+ b=c     ⏏a⏏+ ⏏b⏏=c⏏
        a + b=c    ⏏a⏏ + ⏏b⏏=c⏏
    而接下来的 \s* 是匹配零个或多个空白。    
)