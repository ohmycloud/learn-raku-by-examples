use v6;
use Grammar::Debugger;
grammar Token::Rule::Difference {
    # rule TOP {    [\w+]+ % ' ' | [\d+]+ % ' ' }
    # rule TOP { | [\w+]+ % ' ' | [\d+]+ % ' ' }
    # rule TOP { | [\w+]+ % ' '
    #            | [\d+]+ % ' '
    #        }

    # token TOP { ^ [<line>\n]+ $ }
    # token line {
    #     | [\w+]+ % ' '
    #     | [\d+]+ % ' '
    # }


    rule TOP { ^ <wrap>+ $}
    token wrap { <line> }
    rule line {
         [\w+]+ % ' ' | [\d+]+ % <[-\s:]>
    }
}

my $str = q:to/EOF/;
token takes whitespace invisible unless with sigspace
rule is a token without sigspace
2015-12-25 12:23
2016-01-07 13:45
EOF

my $parse = Token::Rule::Difference.parse($str);
say $parse;
