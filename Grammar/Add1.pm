grammar Add1 {
    rule TOP { ^ <math> $ }
    rule math { <operand> <operator> <operand> }
    token operand { \d+ }
    token operator { <[\+\*]> }
}
