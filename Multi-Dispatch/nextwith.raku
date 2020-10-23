proto a(|) {*}
 
multi a(Any $x) {
    say "Any $x";
    return 5;
}
multi a(Int $x) {
    say "Int $x";
    nextwith($x + 1);
    say "never executed because nextwith doesn't return";
}
 
a 1;

# output:
# Int 1
# Any 2
