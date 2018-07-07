my ($a, $b, $c);
:(($a, $b), $c) := ((1, 2), 3);

say "$a, $b, $c";

my ($name, $shares, $price, $year, $mon, $day);

:($name, $shares, $price, ($year, $mon, $day)) := ('ACME', 50, 91.1, (2012, 12, 21) );

say "$year, $mon, $day";