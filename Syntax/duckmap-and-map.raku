# 使用 duckmap 比 map 方便的时候
#| 对列表中的部分元素执行转换, 其余元素按原样输出
#| 使用 duckmap 可以少写一个 else
<a b c d e f g>.map(-> \x {if x ~~ <c d e>.any {x.uc} else { x }}); # (a b C D E f g)
<a b c d e f g>.duckmap(-> \x where x ~~ <c d e>.any { x.uc });     # (a b C D E f g)

#| map 有一个不方便的地方是, 它不能处理嵌套的结构, 例如下面这个它就无能为力了:
(('a', 'b', 'c'), ('d', 'e'), 'f').map(-> \x {if x ~~ <c d e>.any {x.uc} else { x }}); # ((a b c) (d e) f)

#| 而 duckmap 却能下降到嵌套列表中进行处理
(('a', 'b', 'c'), ('d', 'e'), 'f').duckmap(-> \x where x ~~ <c d e>.any { x.uc }); # ((a b C) (D E) f)

#| 对于 Associative 类型的对象, duckmap 会作用到值:
{ first => ('d', 'e'), second => 'f'}.duckmap(-> $_ where <e f>.any { .uc });  # {first => (d E), second => F}

#| 使用 map 来模拟

{ first => ('d', 'e'), second => 'f'}.map(-> \x { 
    |gather for x.kv -> $k, $v {
        take $k,gather for |$v -> $inner {
            if $inner ~~ <e f>.any {
                take $inner.uc
            } else { take $inner } 
        }
    } 
}).say;