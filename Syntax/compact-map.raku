my @strings = ["a", "1.24", "3", "def", "45", "0.23"];

my @compacted = @strings.map(-> $value {
    try { Num($value) }
    if $! { Empty } else { Num($value) }
});

.say for @compacted;