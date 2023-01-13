my Supplier $supplier = Supplier.new;
my Supply   $all      = $supplier.Supply;

my Supply $delayed    = $all.delayed(1);
$delayed.tap(&say);
$supplier.emit($_) for 1..10;
sleep 3;