sub rec($y, $z) {
    return 108 - ((815-1500/$z)/$y);
}
sub default-behavior(Int $N, $default) {
    my @x = (4, 4.25);
    for (2..$N+1) -> $i {
        my $n = rec(@x[$i-1], @x[$i-2]);
        $n = $n.Num if !$default;
        @x.append($n);
    }
    return @x;
}
my @y = default-behavior(20, True);
my @n = default-behavior(20, False);
for @y.kv -> $i, $p {
    my ($a, $b) = $p.Rat.nude;
    say $i.fmt("%02d") ~ " | " ~ @y[$i].fmt("%3.10f") ~ 
        " | "~ @n[$i].fmt("%3.10f") ~ " | $a/$b";
}