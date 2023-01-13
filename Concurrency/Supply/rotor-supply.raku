my Supply $supply = Supply.from-list(<a b c d e>).rotor(2 => -1, :partial);
$supply.tap(&say);
