sub MAIN() {
    my $a = [
        { x => [1, 2], y => ['a', 'b'] }
    ];
    for $a -> $h {
        my ($in, $out) = $h.pairs;
        dd $in{0}<x>;
        dd $out{1}<y>;
    }
}