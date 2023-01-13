my Supply $supply = Supply.from-list(<a A B b c b C>).repeated(:as(&lc));
$supply.tap(&say);           # OUTPUT: «A␤b␤b␤C␤»