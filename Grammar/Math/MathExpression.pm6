unit grammar MathExpression;

token TOP    { <sum> }
rule sum     { <product>+ % '+' }
rule product { <term>+ % '*' }
rule term    { <number> | <group> }
rule group   { '(' <sum> ')' }
token number { \d+ }