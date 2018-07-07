#!/usr/bin/env perl6

# Feed (left-to-right) with parentheses, read top-to-bottom 
my @result = (
    <people of earth>   # (1) Start with the input 
    ==> map({ .tc })    # (2) Capitalize the words 
    ==> grep /<[PE]>/    # (3) Look for P or E 
    ==> sort            # (4) Sort, result is <Earth People> 
);

say @result;

# For illustration, method chaining equivalent, read top-to-bottom 
@result =
    <people of earth>   # (1) Start with the input 
    .map({ .tc })       # (2) Capitalize the words 
    .grep(/<[PE]>/)     # (3) Look for P or E 
    .sort;              # (4) Sort, result is <Earth People> 
say @result;

my @another-result;

<people of earth>
==> map({ .tc })
==> grep /<[PE]>/
==> sort()
==> @another-result;

say @another-result;
