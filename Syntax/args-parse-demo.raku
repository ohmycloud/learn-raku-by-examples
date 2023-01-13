multi sub MAIN(
    :$shape where * ∈ ["rectangle","triangle"], #= the shape you picked
    :$color where * ∈ ["yellow", "red"]         #= the color you picked
    ) {
    say sprintf("you picked a shape of: %10s", $shape);
    say sprintf("you picked a color of: %10s", $color);
}

multi sub MAIN(
    :$hash_type where * ∈ ['MD5', 'SHA1'], #= the hash code
) {
    say $hash_type;
}