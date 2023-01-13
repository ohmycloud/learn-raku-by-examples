#!/usr/bin/env perl6

#| https://stackoverflow.com/questions/57486372/concurrency-react-ing-to-more-than-one-supply-at-a-time
my $i = 0;
my $supply1 = supply { whenever Supply.interval(3, 3) { done if $i++ > 5; emit("B"); } };
my $supply2 = supply { whenever Supply.interval(1, 1) { done if $i++ > 5; emit("A"); } };

react {
    whenever $supply1 -> $x { $x.print };
    whenever $supply2 -> $x { $x.print };
}

## Output: AABAAA