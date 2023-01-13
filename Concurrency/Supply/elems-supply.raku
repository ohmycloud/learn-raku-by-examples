my Supplier $supplier = Supplier.new;
my Supply $all        = $supplier.Supply;

my Supply $elems = $all.elems();
$elems.tap(&say);
$supplier.emit($_) for 1..10;