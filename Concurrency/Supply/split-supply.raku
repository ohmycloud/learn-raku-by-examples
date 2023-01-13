my Supply $words = Supply.from-list(<Hello World From Raku Land!>);
my Supply $s = $words.split(/ <?upper> /, *, :skip-empty);

$s.tap(&say);