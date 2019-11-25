for (0..140).rotor(11=>-1) {
    state $x = 0;
    say "case num if num >= {.min} && num < {.max} => \"{$x++}\""
}