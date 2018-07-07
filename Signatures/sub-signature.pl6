# 模式匹配和 Unpacking

当在 Perl 6 中讨论模式匹配时，人们通常会考虑正则表达式或 Grammar。这些确实是非常强大的模式匹配工具，但不是唯一的工具。

另一个用于模式匹配和解包数据结构的强大工具使用签名。

签名是“只是”参数列表：

```perl6
sub repeat(Str $s, Int $count) {
    #     ^^^^^^^^^^^^^^^^^^^^  the signature
    # $s and $count are the parameters
    return $s x $count
}
```

几乎所有的现代编程语言都有签名，所以你可能会说：没有什么特别的，继续说。但是有两个特征使它们比其他语言中的签名更有用。

第一种是 `multi dispatch`，它允许你用同一个名字写多个例程，但签名不同。虽然非常强大和有用，但我不想纠缠于他们。请参阅“[使用Perl 6](https://github.com/downloads/perl6/book/2012.05.23.a4.pdf)”一书的第6章以获取更多详细信息。

第二个特征是子签名。它允许你为 sigle 参数写签名。

这听起来很无聊，但是举例来说, 它可以让你对数据结构进行声明式验证。对于每个插槽必须是特定但不同类型的数组，Perl 6 没有内置类型。但是你仍然可以在子签名中检查:

```perl6
sub f(@array [Int, Str]) {
    say @array.join: ', ';
}
f [42, 'str'];      # 42, str
#f [42, 23];         # Type check failed in binding to parameter '<anon>'; expected Str but got Int (23)
```

这里我们有一个名为 `@array` 的参数，后面跟着一个方括号，它为数组引入一个子签名。在调用该函数时，将根据签名 `(Int，Str)` 检查数组，因此如果数组不包含恰好一个 Int 和一个 Str，则会引发类型错误。

同样的机制不仅可以用于验证，还可以用于解包，这意味着可以提取数据结构的某些部分。这只需在内部签名使用变量即可：

```perl6
sub head(*@ [$head, *@]) {
    $head;
}
sub tail(*@ [$, *@tail]) {
    @tail;
}
say head <a b c >;      # a
say tail <a b c >;      # b c
```

这里的外部参数是匿名的 (`@`)，尽管对于内部参数和外部参数都可以使用变量。

匿名参数甚至可以省略，并且可以直接写成 `sub tail( [$, *@tail] )`。

子签名不限于数组。为了处理任意对象，请使用圆括号而不是方括号括住它们，并在里面使用命名参数：

```perl6
multi key-type ($ (Numeric :$key, *%)) { "Number" }
multi key-type ($ (Str     :$key, *%)) { "String" }
for (42 => 'a', 'b' => 42) -> $pair {
    say key-type $pair;
}

# Output:
# Number
# String
```

这是有效的，因为 `=>` 构造了一个 [Pair](http://doc.perl6.org/type/Pair)，它有一个 `key` 和一个 `value` 属性。子签名中的 `:$key` 命名参数提取属性 `key`。

您可以使用此功能创建令人印象深刻的内容，例如[基于多重分派和签名解包的红黑平衡树](http://rosettacode.org/wiki/Pattern_matching#Perl_6)。 （[对代码的更详细的解释](http://blogs.perl.org/users/ovid/2013/02/red-black-trees-in-perl-6-explained.html)。）大多数使用情况并不令人印象深刻，但仍然偶尔会非常有用。就像这个小小的[计算器](https://gist.github.com/masak/ca5a82ae76951cc387cc)一样。
