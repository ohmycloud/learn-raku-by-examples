my Supplier $supplier = Supplier.new;
my Supply $supply = $supplier.Supply;

# 全部数字的订阅
#$supply.tap(-> $v { say "Original : $v" });

# grep 准换
my Supply $odd_supply = $supply.grep({ $_ % 2 });
# 奇数订阅
$odd_supply.tap(-> $v { say "Odd : $v" });

# 偶数订阅
my Supply $even_supply = $supply.grep({ not $_ % 2 });
$even_supply.tap(-> $v { say "Even : $v" });

# 加倍数订阅
my Supply $doubled_supply = $even_supply.map(-> $v { $v * $v } );
$doubled_supply.tap(-> $v { say "Doubled : $v" });

# 发射值
$supplier.emit($_) for ^11;