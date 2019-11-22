#!/usr/bin/env perl6

Supply.interval(0.3).tap({
    say $_;
});
sleep 5;