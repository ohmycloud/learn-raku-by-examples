#! /usr/bin/env perl6
#
# Correct user typos in a C source file according to the specification
# given in this question:
#   https://codereview.stackexchange.com/questions/189123/correct-user-typos-in-a-c-source-file-using-perl-6-grammar
#   https://stackoverflow.com/q/49020238/2173773
#

# 要了解 Perl 6 的 Grammar，我为 C 源文件创建了一个简单的解析器。请注意，这是一个由[此问题](https://stackoverflow.com/q/49020238/2173773)激发的构建示例。重点是解析 C 源文件并更正参数列表中的用户输入错误。



use v6;

# Define some test cases...
my $str = q:to/END/;
char *what = "Perl6 grammar example (parsing a C source file)";
foo(bar baz);
foo(bar baz, bak);
foo(bar baz, foo(bar baz)); # recursive call to foo(bar baz)
foo( "bar baz");
foo("bar baz" bak);
foo("bar baz" bak "123 (abc d)", 5);
END

class C-simple-actions {
    method string-constant ($/) {
        make ~$/;
    }

    method make-data ($match-data) {
        $match-data.make( [~] $match-data.chunks.map: {$_.value.?made // $_.value} );
    }
    method TOP ($/) {
        self.make-data( $/ );
    }

    method all-text ($/) {
        self.make-data( $/ );
    }

    method func-call ($/) {
        self.make-data( $/ );
    }

    method normal-text ($/) {
        self.make-data( $/ );
    }

    method argument ($/) {
        self.make-data( $/ );
    }
    method white-space ($/) {
        make ~$/;
    }

    method arg-separator ($match-data) {
        my $str = $match-data.Str;
        if $str ~~ /^ \s+ $/ {
            $match-data.make(", ");
        }
        else {
            $match-data.make( $str );
        }
    }
}

grammar C-simple {
    token TOP { <all-text> }
    token all-text { [<normal-text> <func-call>]* <normal-text>?}

    # The 'normal-text' token represents:
    #   1. String constants (these can include internal parenthesis '(...)' that
    #        will not be recognized as 'func-call' tokens, as defined below).
    #        E.g.: char *what = "Perl6 grammar example (parsing a c source file)";
    #        The parenthesis in the previous string constant is then not a
    #        'func-call' token.
    #      Note: string constant in comments will be included in normal-text.
    #      Note: string constants can also occur inside 'func-call' tokens.
    #   2. All other code, except 'func-call' tokens (as defined below)
    #      Note: For this simplified parser we do not distinguish between
    #        code and comments (i.e. // ... or /* ... */ ).
    #        This means that 'func-call' tokens inside comments
    #        will not be included in 'normal-text' tokens as well.
    token normal-text { [<!before '('> [<string-constant> || .] ]+ }

    # A C-'string-constant' token is (a string) delimited by double quotes and
    # can include internal double quotes when preceded by a backslash escape character.
    # There can be a backslash at the end of the string, if escaped
    # with another backslash, i.e "Hello\\" ...
    token string-constant { '"' ['\"' || '\\' || <-["]>]+ '"' }

    # Note: this is not currently parsing real C code. It assumes that
    # any function argument is separated by a space (user typo) or
    # a comma. But this has the obvious flaw that, e.g. func( 2 + 3 )
    # will be interpreted as a typo and corrected to func(2, +, 3)
    # while it most likely is not a user typo..
    token func-call {
        '(' <white-space>?
        [<argument> <arg-separator>]* <argument>
        <white-space>? ')'
    }

    # Note: allows for recursive function calls inside the argument..
    token argument {
        [<!before <arg-separator>>
         [<string-constant> || <func-call> || <-[()]>] ]+
    }
    token white-space { \s+ }

    token arg-separator { \s+ || [\s* ',' \s*] }

}

print $str;
my $result = C-simple.parse( $str, actions => C-simple-actions.new);
say "-" x 80;
print $result.made;

# 虽然这个解析器似乎按照规范工作，但我很想知道是否有更简单的方法来编写 grammar 的 action 类 `C-simple-actions`？目前，这些方法只是向上填充 `" " -> ", "` 更改，直到达到 `TOP` 方法。这对我来说似乎太过冗长，是否可以简化？
