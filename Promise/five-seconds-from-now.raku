#!/usr/bin/env perl6

my $five-seconds-from-now = Promise.in: 5;
$five-seconds-from-now.then: { put "It's been 5 seconds until " ~ .status }

# if there is no sleep, the program exit and output nothing
sleep 7;