my Supplier $supplier = Supplier.new;
my Supply $supply     = $supplier.Supply;
 
$supply.tap( -> $v { sleep 0.05; say '|' ~ $v ~ '|' });
 
for 1 .. 10 {
    $supplier.emit($_);
}