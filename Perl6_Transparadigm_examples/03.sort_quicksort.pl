#! /usr/bin/env perl6
use v6;

sub quicksort( *@list ) {
    return @list if @list.elems < 2;

    my $pivot = @list.shift;
#     my $pivot = @list.=pick(*).shift;

    my (@before, @after);
    for @list -> $elem {
        if $elem before $pivot { @before.push($elem); }
        else                   { @after.push($elem);  }
    }

    return quicksort(@before),
           $pivot,
           quicksort(@after);
}

#my @data = 6, 7, 2, 1, 8, 9, 5, 3, 4;
my @data = < p e r l s i x >;

say "input  = {           @data  }";
say "output = { quicksort(@data) }";



















