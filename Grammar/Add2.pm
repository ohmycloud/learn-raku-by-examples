grammar Add2 {
    rule TOP { ^ <math> $ }
    rule math { 
        <operand>
        [ <operator> || {die "missing operator"} ] 
        [ <operand> || { die "Missing second operand" } ]
        [ \S { die "Invalid value after the second operand" } ]?
    }
    token operand { \d+ }
    token operator { <[\+\*]> || \D { die "Invalid operator" } }
}
