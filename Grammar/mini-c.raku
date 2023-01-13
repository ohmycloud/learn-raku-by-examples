#!/usr/bin/env raku
use v6.d;
my $statement = q:to/END/;
a= 1
b= 2
c = a, 5, b
END

grammar VariableLists {
    token TOP        { <statement>* }
    rule statement   { <identifier> '=' <termlist> \n }
    rule termlist    { <term> * % ',' }
    token term       { <identifier> | <number> }
    token number     { \d+ }
    token identifier { <:alpha> \w* }
    token ws         { <!ww> \h*    }
}

my $match = VariableLists.parse($statement);
dd $match;