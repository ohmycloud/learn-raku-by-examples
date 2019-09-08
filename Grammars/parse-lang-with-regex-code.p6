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
        | <identifier> '=' <value>
              { say "$<identifier>=$<value>" }
        | <identifier> '=' <identifier>
    }
    rule printout {
        | 'print' <value>
        | 'print' <identifier>
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