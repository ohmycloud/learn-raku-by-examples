grammar Lang {
    rule TOP {
        ^ <statements> $
    }
    rule statements {
        <statement>+ %% ';'
    }
    rule statement {
        | <assignment>
        | <printout>
    }
    rule assignment {
        <identifier> '=' <expression>
    }
    rule printout {
        'print' <expression>
    }
    rule expression {
        | <identifier>
        | <value>
    }
    token identifier {
        (<:alpha>+)
    }
    token value {
        (\d+)
    }
}

class LangActions {
    has %var;

    method assignment($/) {
        %!var{$<identifier>} = $<expression>.made;
    }
    method printout($/) {
        say $<expression>.ast;
    }
    method expression($/) {
        if $<identifier> {
            $/.make(%!var{$<identifier>} // 0);
        }
        else {
            $/.make(+$<value>);
        }
    }
    method identifier($/) {
        $/.make(~$0);
    }
    method value($/) {
        $/.make(+$0)
    }
}

Lang.parsefile(
        'data/test.lang',
        :actions(LangActions.new())
        );