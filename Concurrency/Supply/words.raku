# 从列表创建一个 Supply
my $s = Supply.from-list("Hello Word!".comb);

# 对 Supply 进行转换
my $ws = $s.words;

# emit 值
$ws.tap(&say);           # OUTPUT: «Hello␤Word!␤»