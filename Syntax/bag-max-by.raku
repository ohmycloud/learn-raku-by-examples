my @a = 3.26,3.27,3.27,3.27,3.27,3.27,3.27,3.26,0.71,0.71,0.00,0.00;

my $bag = @a.Bag;

# 使用 max 子例程
say max($bag.hash, :by( { .key })); # 3.27 => 6
say min($bag.hash, :by( { .key })); # 0 => 2

# 或使用 maxpairs/minpairs 方法
say $bag.maxpairs; # 3.27 => 6
say $bag.minpairs; # 0 => 2 3.26 => 2 0.71 => 2