sub list-of($n) {
  do for ^$n { # note the use of the range-to prefix operator `^` (`0..^N`)
    $_.say; # current loop iteration
  }
}
my @list3 = list-of(3); #=> (0, 1, 2);
