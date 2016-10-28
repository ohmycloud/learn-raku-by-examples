my %words := Bag.new(slurp.comb(/\w+/).map(*.lc));
# say %words.pairs.list.join("\n");
# .say for %words.pairs.sort(-*.value);  # 按键值从大到小排序，然后打印，- 号是降序
# "and" => 12
# "the" => 11
# "our" => 6
# "be" => 6
# "man" => 6
# "your" => 6
# "us" => 5
# "you" => 5
# "for" => 5
# "o" => 5
# "to" => 5

for %words.pairs.sort(-*.value).map({ $_.key, $_.value }) -> $word, $count {
    say "$word: $count";
}
# .say for %words.pairs.sort(-*.value).fmt("%-15s=>%4d\n");
