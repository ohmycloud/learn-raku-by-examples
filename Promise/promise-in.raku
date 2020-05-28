#!/usr/bin/env perl6

my $five-seconds-from-now = Promise.in: 5;

$five-seconds-from-now.then: { .status.say }

loop {
    sleep 1;
    put "Promise status is: ", $five-seconds-from-now.status;
}