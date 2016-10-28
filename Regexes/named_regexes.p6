use v6;

# 具名正则的声明
my regex number { \d+ [ \. \d+]? }  # 具名正则
my token ident  { \w+            }
my rule  alpha  { <[A..Za..z]>   }

# 1.0 通过 & 来引用
say so "12.34" ~~ &number; # true

# 2.0 在正则构造 // 里使用
say so "12.88 + 0.12" ~~ / <number> \s* '+' \s* <number> /; # true
# say so "12.88 + 0.12" ~~ / <left=.number> \s* '+' \s* <right=.number> /;
# wrong, method 'number' not found for invocant of class 'Cursor'

# 3.0 在 grammar 里面使用
grammar EquationParse {
    # 这里也不能给 number 起别名, 除非 number 是在 grammar 内部声明的
     token TOP { <number> \s* '+' \s* <number> \s* '=' \s* <number> }
}

# 等式解析
my $expr = EquationParse.parse("12.88 + 0.12 = 13.00");
say $expr;
