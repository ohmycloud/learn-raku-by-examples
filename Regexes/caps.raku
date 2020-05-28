# caps 方法返回所有的捕获，命名的和位置的，按照它们匹配的文本在原始字符串中出现的顺序返回。
# 返回的值是一个 Pair 对象列表。键是捕获的名字或数量，键值是对应的 Match 对象。

if 'abc' ~~ m/(.) <alpha> (.) / {
            say $/.caps.WHAT; # (Parcel)
            my @a = $/.caps;
            say @a;           # 0 => ｢a｣ alpha => ｢b｣ 1 => ｢c｣ ( 0 => ｢a｣ 是一个 Pair 对象
            say " -> 这次匹配有  @a.elems() 个 Pair";
               for $/.caps {
                    say .key, ' => ', .value.Str; # 键值是 对应的Match 对象, 需要调用 Str 方法, 得到字符串.

             }
 }

 # Output:
 #          0 => a
 #      alpha => b
 #          1 => c


#  复习下 Parcel
# Parcel 由 () <>  逗号分割的列表, 或其它引用结构
# ()
# 1,2,3
# <a b c>
# <<a b c>>
# qw/a b c/
