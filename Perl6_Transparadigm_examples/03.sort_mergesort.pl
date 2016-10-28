#! /usr/bin/env perl6
use v6;

sub merge (@a, @b) {
    gather while @a && @b {
        if @a[0] before @b[0] { take @a.shift }
        else                  { take @b.shift }
    },
    @a,
    @b;
}

sub mergesort ( *@list ) {
    return @list if @list.elems <= 1;

    my $middle = @list.elems div 2;
    my @left   = mergesort @list[ 0 ..^ $middle ];
    my @right  = mergesort @list[ $middle .. *  ];

    return merge(@left, @right);
}

# my @data = 6, 7, 2, 1, 8, 9, 5, 3, 4;
my @data = < p e r l s i x >;

say "input  = {           @data  }";
say "output = { mergesort(@data) }";
