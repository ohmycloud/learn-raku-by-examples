my Supplier $supplier = Supplier.new;
my Supply $supply1  = $supplier.Supply;
my Supply $supply2  = $supplier.Supply;

# 订阅
my $tap1 = $supply1.tap( -> $v { say $v });
my $tap2 = $supply2.tap( -> $v { say $v });
my $tap3 = $supply1.tap( -> $v { say $v * $v });

for 1..5 {
    $supplier.emit($_);
}

# 订阅被关闭之后, supplier 再次 emit 的数据, 订阅者就收不到了
$tap1.close;
#$tap2.close;
$supplier.emit({say "Won't trigger the tap, otherwise the tap is open"; 12}());