class Enemy {
    method attack-with-arrows   { say "peow peow peow" }
    method attack-with-swords   { say "swish cling clang" }
    method attack-with-fireball { say "sssSSS fwoooof" }
    method attack-with-camelia  { say "flap flap RAWWR!" }
}

# 创建一个方法筛选器， 方法名以 attack-with- 开头
# 对象的 ^methods 方法返回该对象所有的方法，包括自定义的方法
my $selector = { .name ~~ /^ 'attack-with-' / };
given Enemy.new -> $e {
    my $attack-strategy
        = $e.^methods().grep($selector).pick();

    $e.$attack-strategy();           # call a random method
}
