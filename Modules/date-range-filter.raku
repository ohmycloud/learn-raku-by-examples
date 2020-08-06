#!/usr/bin/env perl6

lazy my @dates = Date.new('2014-01-01') ... Date.new('2015-01-01');

.say for @dates.grep: -> $d {
    $d.day-of-week == 2 &&
    4  <= $d.month <= 11 &&
    $d.weekday-of-month == 2
}