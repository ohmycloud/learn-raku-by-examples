grammar Calc {
    rule TOP {
        ^ <expression> $
    }
    rule expression {
        | <term>+ %% $<op>=(['+'|'-'])
        | <group>
    }
    rule term {
        <factor>+ %% $<op>=(['*'|'/'])
    }
    rule factor {
        | <value>
        | <group>
    }
    rule group {
        '(' <expression> ')'
    }
    token value {
        | \d+['.' \d+]*
        | '.' \d+
    }
}

say Calc.parse('3*4*5');