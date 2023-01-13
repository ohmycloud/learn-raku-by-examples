my Supplier $supplier = Supplier.new;
my Supply $all        = $supplier.Supply;
my Supply $ints       = $all.grep(Int);

$ints.tap(&say);
$supplier.emit($_) for 1, 'a string', 3.14159, 5, 9;   # prints only 1, 5, 9