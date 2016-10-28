my $keywords = set <if for unless while>; # create a set

sub has-keyword(*@words) {
    for @words -> $word {
        return True if $word (elem) $keywords; # 依次检查数组中的元素是否属于集合 $keywords
    }
    False;
}

say has-keyword 'not', 'one', 'here';       # False
say has-keyword 'but', 'here', 'for';       # True
