for (:add(1, 5), :sub(9, 8), :mult(7, 7)) {
    try -> :$add ($a, $b) { say "$a + $b is {$a+$b}" }(|$_)
    #try { say "$add[0] + $add[1] is $add.sum()"}(|$_)
}