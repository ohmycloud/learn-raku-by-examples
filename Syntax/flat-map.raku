#| 模仿 Rust 中的 flat_map
my $line = "123\nthree\n456\thello\n78.9";
my @words = $line.split(/\s/).map: *.Str;
dd @words;