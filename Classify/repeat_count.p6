use v6;

# 怎样在一个数组中找出每个元素重复的次数呢？将每个元素和重复次数对应输出。
my @a = 1,2,6,6,6,6,9,9;
my %hash = @a.classify(*.Str);
for %hash.kv -> $k,$v {say "$k    | $v.elems()"}
