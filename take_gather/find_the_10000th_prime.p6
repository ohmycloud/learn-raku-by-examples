my @vals = lazy gather {
    for ^Inf {
        take $_ if .is-prime;
    }
}

say @vals[10000];
say now - INIT now;