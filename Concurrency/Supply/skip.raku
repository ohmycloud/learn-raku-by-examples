my Supplier $supplier = Supplier.new;
my Supply $supply = $supplier.Supply;

$supply = $supply.skip(3);
$supply.tap({ say $_ });
$supplier.emit($_) for 1..10; # OUTPUT: «4␤5␤6␤7␤8␤9␤10␤»