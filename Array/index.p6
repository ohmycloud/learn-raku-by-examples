use v6;

my @a = $=finish.lines.words;

for @a.kv -> $key, $value {
    say $value if $value >= 20;
}


=finish
20 12 34
12 34 56
34 55 78
