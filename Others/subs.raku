class F {
     method AT-POS(Int $index) {$index}
}

my $x = F.new;

for 0..10 -> $index {
    say $x[$index];
}