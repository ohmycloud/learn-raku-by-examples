# 如果你在捕获后面加上量词，匹配对象中的对应的项是一列其它对象：

use v6;
my $ingredients = 'eggs, milk, sugar and flour';

if $ingredients ~~ m/(\w+)+ % [\,\s*] \s* 'and' \s* (\w+)/ {
    say 'list: ', $/[0].join(" | ");
    say 'end: ', "$/[1]";
    say $/.elems; # 数组 $/ 中含有 2 个元素
    say $/[0].WHAT;  # ARRAY, 第一个捕获 $/[0] 其实是一个数组
    say $/[0].elems; # 3, 第一个 (\w+) 匹配了 3 次
}

# 这打印:
# list: eggs | milk | sugar
# end: flour

#  第一个捕获(\w+)被量词化了，所以$/[0]包含一列单词。代码调用 .join方法将它转换为字符串。
#  不管第一个捕获匹配了多少次（并且有$/[0]中有多少元素），第二个捕获$/[1]始终可以访问。
