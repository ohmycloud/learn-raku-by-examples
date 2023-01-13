my Supply $s = Supply.from-list(4, 10, 3, 2);
my Supply $hs = $s.head(2);
$hs.tap(&say);           # OUTPUT: «4␤10␤»

my Supply $whatever-code-hs = $s.head(* - 2);
$whatever-code-hs.tap(&say);