sub prefix:<♥>(&c) {
    LEAVE say (now - ENTER now) ~ 's';  # Don't you ♥ Raku?
    c
}

♥ { say sum gather for ^1_000_000 { .take if .is-prime; } }; # 1.399831818s
♥ { say sum eager for ^1_000_000 { .&next if .is-prime; } }; # 1.131352526s
♥ { say sum do for ^1_000_000 { .&next if .is-prime; } };    # 1.60557427s
♥ { say sum (^1_000_000).grep: *.is-prime; };             # 0.778440528s
