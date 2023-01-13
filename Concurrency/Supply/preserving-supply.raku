my Supplier::Preserving $supplier .= new;
start   { react whenever $supplier { say $_ }}
for ^10 { $supplier.emit($_) }
sleep 1;