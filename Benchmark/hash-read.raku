my %h = a => 10, b => 12;
my $total = 0;
for ^10_000_000 {
    $total = $total + %h<a> + %h<b>;
}