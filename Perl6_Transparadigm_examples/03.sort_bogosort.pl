#! /usr/bin/env perl6
use v6;

sub bogosort ( *@list ) {

    until [!after] @list {
        @list .= pick(*);
    }

    return @list;
}

#my @data = 6, 7, 2, 1, 8, 9, 2;
my @data =  < p e r l s i x >;

say 'input  = ' ~          @data;
say 'output = ' ~ bogosort @data;

