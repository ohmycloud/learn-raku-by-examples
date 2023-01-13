my Supply $s = Supply.from-list(4, 10, 3, 2);
my Supply $ts = $s.tail(2);
$ts.tap(&say);           # OUTPUT: «3␤2␤»

my Supply $whatever-code-ts = $s.tail(* - 2);
$whatever-code-ts.tap(&say);