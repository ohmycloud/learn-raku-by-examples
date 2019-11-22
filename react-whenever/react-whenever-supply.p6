#!/usr/bin/env perl6

react {
    whenever Supply.interval(0.5) {
        .say;
    }
}