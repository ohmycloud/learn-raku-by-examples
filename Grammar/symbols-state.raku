#!/usr/bin/env raku
use v6.d;

my $statement = q:to/END/;
a=1
c = a, 5, a
b=2
END

grammar VariableLists {
    token TOP {
        :my %*SYMBOLS;
        <statement>*
    }
    token ws { <!ww> \h* }
    rule statement {
        <identifier>
        { %*SYMBOLS{ $<identifier> } = True }
        '=' <termlist>
        \n
    }
    rule termlist { <term> * % ',' }
    token term    { <variable> | <number> }

    # 解析失败也无所谓, 因为 token 是非回溯的
    token variable {
        <identifier>
        <?{ %*SYMBOLS{ $<identifier> } }>
    }
    token number { \d+ }
    token identifier { <:alpha> \w* }
}

my $match = VariableLists.parse($statement);
dd $match;