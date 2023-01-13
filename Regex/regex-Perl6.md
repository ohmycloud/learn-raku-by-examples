在 Perl 6 中, `Null regex` 是非法的：

```perl6
//
```
要匹配一个零宽字符, 需要显式地表示 null 匹配：

```perl6
/ '' /;
/ <?> /;
```

例如：

```perl6
split /''/, $string;
```

 分割字符串。所以这样也行：

```perl6
split '', $string;
```

同样地，匹配一个空的分支，使用这个：

```perl6
/a|b|c|<?>/
/a|b|c|''/
```

更容易捕获错误：

```oc
/a|b|c|/
```

 作为一种特殊情况, 匹配中的第一个 null 分支会被忽略：

```oc
ms/ [
    | if   :: <expr> <block>
    | for  :: <list> <block>
    | loop :: <loop_controls>? <block>
    ]
/ 
```
这在格式化 regex 时会有用。
但是注意, 只有第一个分支是特殊的, 如果你这样写：

```oc
ms/ [
        if   :: <expr> <block>           |
        for  :: <list> <block>           |
        loop :: <loop_controls>? <block> |
    ]
/
```
 就是错的。因为最后一个分支是 null 。
