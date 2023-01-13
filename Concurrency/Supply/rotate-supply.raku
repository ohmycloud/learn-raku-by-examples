my Supply $supply = Supply.from-list(<a b c d e>).rotate(2);
$supply.tap(&say); # OUTPUT: «c␤d␤e␤a␤b␤»