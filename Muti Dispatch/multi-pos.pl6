#!/usr/bin/env perl6

use v6;

multi sub Screen_get_valid_string($prompt, $accept_empty_string where $_ == True|False,  $max_length = 999) { return "abc" }
multi sub Screen_get_valid_string($prompt, $max_length = 999)                       { return "def" }

my $return = Screen_get_valid_string("enter value for string => ", True);

say 'return  is ', $return;
