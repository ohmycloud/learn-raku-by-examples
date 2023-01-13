# 从列表创建一个订阅 Supply
my $supply = Supply.from-list(<a A B b c b C A b c D>).unique(:as(&lc));
say $supply.WHAT; # Supply

# emit
$supply.tap(&say);