#!/usr/bin/env perl6

#| https://stackoverflow.com/questions/57486372/concurrency-react-ing-to-more-than-one-supply-at-a-time
my Channel $c .= new;
my $supply1 = start { loop { await Promise.in(1);   $c.send("B"); } };
my $supply2 = start { loop { await Promise.in(0.5); $c.send("A"); } };

react {
    whenever $c.Supply -> $x { $x.print };
}

$c.close;