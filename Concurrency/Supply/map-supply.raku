my Supplier $supplier = Supplier.new;
my Supply $all = $supplier.Supply;
my Supply $double = $all.map(-> $value { $value * 2 });

$double.tap(&say);
$supplier.emit($_) for 1..5;