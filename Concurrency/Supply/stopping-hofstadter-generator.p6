#!/usr/bin/env perl6

multi a(1) { 1 }
multi a(2) { 2 }
multi a($n where $n > 2) { a($n - a($n-1)) + a($n - a($n-2)) }

my $hofstadter-generator = supply {
    for (1 ... *).map(-> $n { a($n) }) -> $v {
        emit $v;
        done if $v > 100;
    }
}

react {
    whenever $hofstadter-generator -> $v {
        note $v;
    }
    whenever Supply.interval(1) {
        say "Waiting...";
    }
}