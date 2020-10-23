proto a(|) { * }

multi a( Any $x ) {
    say "Any $x";
    return 5; 
}

#| `callsame` 调用下一个匹配的候选者，参数与当前候选者相同，
#| 并返回该候选者的返回值。
multi a( Int $x ) {
    say "Int $x";
    my $res = callsame;
    say "Back in Int with $res";
}

a 1;

# output:
# Int 1
# Any 1
# Back in Int with 5
