#!/usr/bin/env raku
use v6.d;

my $block = q:to/END/;
a= 1
b= 2
{
    c = a, 5, b
}
END

class SymbolTable {
    has @!scopes = {},;   # 初始化一个空的散列到数组中
    method enter-scope() {
        @!scopes.push({}) # 进入作用域时 push 一个空的散列
    }
    method leave-scope() {
        @!scopes.pop();   # 退出作用域时 pop 一个空的散列
    }
    method declare($variable) {
        @!scopes[*-1]{$variable} = True
    }
    method check-declared($variable) {
        for @!scopes.reverse -> %scope {
            return True if %scope{$variable};
        }
        return False;
    }
}

grammar VariableLists {
    token TOP {
        :my $*ST = SymbolTable.new();
        <statement>*
    }
    token ws { <!ww> \h* }
    token statement {
        | <declaration>
        | <block>
    }
    rule declaration {
        <identifier>
        { $*ST.declare( $<identifier> ) }
        '=' <termlist>
        \n
    }
    rule block {
        '{' \n*
            { $*ST.enter-scope() }
            <statement>*
            { $*ST.leave-scope() }
        '}' \n*
    }
    rule termlist { <term> * % ',' }
    token term { <variable> | <number> }
    token variable {
        <identifier>
        <?{ $*ST.check-declared($<identifier>) }>
    }
    token number { \d+ }
    token identifier { <:alpha> \w* }
}

my $match = VariableLists.parse($block);
dd $match;