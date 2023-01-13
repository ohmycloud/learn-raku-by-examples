my $s = Supply.from-list("Hello Word!".comb);
my $ws = $s.words;
$ws.tap(&say);           # OUTPUT: «Hello␤Word!␤»