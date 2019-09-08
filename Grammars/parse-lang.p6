grammar Lang {
    rule TOP        {
        ^ <statements> $
    }
    rule statements {
        <statement>+ %% ';'
    }
    rule statement  {
        | <assignment>
        | <printout>
    }
    rule assignment {
        <identifier> '=' <expression>
    }
    rule printout   {
        'print' <expression>
    }
    rule expression {
        | <identifier>
        | <value>
    }
    token identifier {
        <:alpha>+
    }
    token value {
        \d+
    }
}

my $parsed = Lang.parsefile('data/test.lang');
say $parsed;