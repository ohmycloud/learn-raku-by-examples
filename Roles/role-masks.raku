#!/usr/bin/env perl6

role R {
    method a { 666 }
}
class C does R {
    has $.a = 42;
}
say C.new.a;