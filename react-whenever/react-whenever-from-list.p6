#!/usr/bin/env perl6

react {
    whenever Supply.from-list('a' .. 'e') {
        .say;
    }
}