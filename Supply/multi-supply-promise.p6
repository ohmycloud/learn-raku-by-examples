#!/usr/bin/env perl6

#| https://stackoverflow.com/questions/57486372/concurrency-react-ing-to-more-than-one-supply-at-a-time
my constant READY = Promise.kept;
my $i = 0;
my $supply1 = supply whenever READY {
    loop { await Promise.in(3); done if $i++ > 5; emit("B"); }
}
my $supply2 = supply whenever READY {
    loop { await Promise.in(1); done if $i++ > 5; emit("A"); }
}

react {
    whenever $supply1 -> $x { $x.print };
    whenever $supply2 -> $x { $x.print };
}

## Output: AABAAA