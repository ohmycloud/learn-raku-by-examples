unit grammar Lang::Grammar;

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
    | <term>+ %% $<op>=(['+'|'-'])
    | <group>
}

rule term {
    <factor>+  %% $<op>=(['*'|'/'])
}

rule factor {
    | <identifier>
    | <value>
    | <group>
}

rule group {
    '(' <expression> ')'
}

token identifier {
    (<:alpha>+)
}

token value {
    (
    | \d+['.' \d+]?
    | '.' \d+
    )
}
