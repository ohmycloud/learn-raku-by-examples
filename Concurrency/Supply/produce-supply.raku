my Supply $supply = Supply.from-list(1..5).produce({$^a + $^b});
$supply.tap(-> $v { say "$v" }); # OUTPUT: «1␤3␤6␤10␤15␤»

# (1..5).produce({$^a + $^b}) 相当于 [\+] 1..5