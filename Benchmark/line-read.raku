my $fh = open "longfile";
my $chars = 0;
for $fh.lines { $chars = $chars + .chars };
$fh.close;
say $chars