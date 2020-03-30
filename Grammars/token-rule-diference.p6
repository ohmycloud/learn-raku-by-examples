#use Grammar::Debugger;
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

my regex no-sigspace-regex   { 'once' 'upon' 'a' 'time'  }
my token no-sigspace-token   { 'once' 'upon' 'a' 'time'  }

# :sigspace is enabled by default in rule, and any whitespace after terms
# and closing parenthesis/brackets are turned into a non-capturing call to ws
# that is, <.ws>, where . means non-capturing
my rule  with-sigspace-rule  { 'once' 'upon' 'a'   'time'  }

# is the same as
my token with-sigspace-rule { 'once' <.ws> 'upon' <.ws> 'a' <.ws> 'time' <.ws> }

        # the default `ws` matches zero or more whitespace characters, as long as that point is not within a word
# regex ws { <!ww> \s* }
my token token-with-ws       { 'once' <.ws> 'upon' <.ws> 'a'  <.ws> 'time' }

say so 'onceuponatime'     ~~ /<no-sigspace-regex>/;   # True
say so 'onceuponatime'     ~~ /<no-sigspace-token>/;   # True
say so 'onceuponatime'     ~~ /<with-sigspace-rule>/;  # False
say so 'once upon a time'  ~~ /<with-sigspace-rule>/;  # True
say so ' once upon a time' ~~ /<with-sigspace-rule>/;  # True
say so 'once upon a time ' ~~ /<with-sigspace-rule>/;  # True
say so 'once upon a time'  ~~ /<token-with-ws>/;       # True, <.ws> matches zero or more whitespace characters
say so 'once  upon a time' ~~ /<token-with-ws>/;       # True, <.ws> matches zero or more whitespace characters

# the first <.ws> matches word boundary at the start of line,
# and the second <.ws> matches the whitespace between 'b' and 'c'
say 'ab c' ~~ /<.ws> ab <.ws> c/; # ｢ab c｣

# Failed match: there is neither any whitespace nor a word boundary between 'a' and 'b'
say 'ab' ~~ / . <.ws> b/; # Nil

# Successful match: there is a word boundary between ')' and 'b'
say ')b' ~~ /. <.ws> b/; # ｢)b｣




















