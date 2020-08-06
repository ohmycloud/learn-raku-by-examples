    my $counter = 0;
    my $test := hyper gather { for 1 .. 5 { $counter++; take $_; } }
    say $test.sort.values;
    say $counter;