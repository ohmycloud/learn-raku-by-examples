proto a(|) { * }

multi a( Any $x ) {
    say "Any $x";
    return 5;
}

multi a( Int $x ) {
    say "Int $x";
    nextsame;
    say "never executed because nextsame doesn't return";
}

a 1;

# output:
# Int 1
# Any 1
