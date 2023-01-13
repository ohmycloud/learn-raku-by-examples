sub MAIN() {
    my @strings = [
        Q｢｢aSbTc｣｣,
        Q｢｢A BxyC$B｣｣,
        Q｢｢XY12｣｣
    ];

    .comb.map(-> $n { if 65 <= $n.ord <= 90 { "<{$n}>"} else {"'{$n}'"} }).join(' ').say for @strings;
}
