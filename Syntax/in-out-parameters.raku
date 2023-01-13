sub in-out-sub(Str $name is rw) {
    $name ~= " World";
    return Pair.new("a", "3")
}

my $name = "Hello";
my $p = in-out-sub($name);
say $name;
say $p;
