use v6;

my $row = $=finish.lines[0].words.elems;

my $count = 1;
my $sum = 0;
for $=finish.lines[2..*] -> $line {
    my @words = $line.words;
    my @line = @words[1..$count];
    $sum += @line.min;
    $count++;
    
}
say $sum;

=finish
	Go	Or	HyL	HyS
Go	0	357	532	498
Or	357	0	477	488
HyL	532	477	0	126
HyS	498	488	126	0