use v6;
my @integers = 1..*;
    for @integers -> $i {
        say $i;
        last if $i % 17 == 0;
    }
