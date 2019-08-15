my $s = 'the quick brown fox jumped over the the lazy dog';
my regex word { \w+ [ \' \w+ ]?              }
my regex dup  { « <danci=&word> \W+ $<danci> » } # 要使用 &name 调用正则, 就像调用子例程一样 &sub , 调用后的结果起名为 danci, 就像给子例程起名字一样
if $s ~~ m/ <dupword=&dup> / {
    say "Found '{$<dupword><danci>}' twice in a row";
    # say $/.keys(); # dupword, 获取散列的键
    say $/;
}

# 这段代码引入了一个名为 word 的正则表达式，它至少匹配一个单词字符，后面跟着一个可选的单引号和更多的单词字符。
# 另外一个名为 dup （duplcate的缩写，副本的意思）的正则包含一个单词边界锚点。

# 在正则里面，语法 <&word> 在当前词法作用域内查找名为word的正则并匹配这个正则表达式。 
# <name=&regex> 语法创建了一个叫做 name 的捕获，它记录了 &regex 匹配的内容。
 
# 在这个例子中，dup 调用了名为 word 正则，随后匹配至少一个非单词字符，之后再匹配相同的字符串（ 前面word 正则匹配过的）一次，它以另外一个字符边界结束。这种向后引用的语法记为美元符号 $  后面跟着用尖括号包裹着捕获的名字。
 
# 在 if 代码块里， $<dupword> 是  $/{'dupword'} 的快捷写法。因为 $/ 是一个特殊的散列, 所以可以通过键 {'dupword'} 访问到散列的值. 它访问正则 dup 产生的匹配对象。
# dup 也有一个叫 danci 的子规则。从那个调用产生的匹配对象用 $<dupword><danci>来访问。
 
# 直接打印 $/ 的结果, $/ 这里又变成了一个特殊的散列, fuck, 上次它不是一个特殊的数组吗? 百变星君啊,擦!
# 

# ｢the the｣
#  dupword => ｢the the｣
#   danci => ｢the｣ 
