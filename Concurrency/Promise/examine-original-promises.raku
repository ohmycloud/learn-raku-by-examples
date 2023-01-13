my @promises;
for 1..5 -> $t {
    push @promises, start {
        sleep $t;
        Bool.pick;
    };
}
say await Promise.allof(@promises).then({ so all(@promises>>.result) });