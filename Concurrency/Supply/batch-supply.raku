my Supplier $supplier = Supplier.new;
my Supply   $all      = $supplier.Supply;
my Supply   $batch    = $all.batch(:elems(3), :seconds(1));

$batch.tap(&say);
$supplier.emit($_) for 1..100;