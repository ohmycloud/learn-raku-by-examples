#!/usr/bin/env perl6

use v6;

# from https://stackoverflow.com/questions/49963853/method-returning-a-regex-in-perl-6
class TEST {
    has Str $.str;

    method reg {
        my $str = $.str;
        return 
            regex {
               <<
               <[abc]> *
               $str
               <!before foo>
               }
    }         
}   

my $var = TEST.new(str => 'baz');
say $var.reg;
say "foo" ~~ $var.reg;
say "<<abaz" ~~ $var.reg

