#| simulate filter_map function in Rust
#| anonymous sub in map
my $line = "123\nthree\n456\thello\n78.9";
my @numbers = $line.split(/\s/).map(-> \x { if x ~~ /\d+[\.\d+]?/ { -1.0 * x } else { Empty} });
say ~@numbers; # -123 -456 -78.9


#| named sub in map
#| if the number is greater than 100, takes its negative
#| otherwise, return Empty
sub greater-than-one-hundred($word) {
    if $word ~~ /\d+[\.\d+]?/ && $word.Rat > 100 {
        -1.0 * $word.Rat
    } else {
        Empty
    }
}

my @numbers-greater-than-one-hundred = $line.split(/\s/).map(&greater-than-one-hundred);
say ~@numbers-greater-than-one-hundred; # -123 -456