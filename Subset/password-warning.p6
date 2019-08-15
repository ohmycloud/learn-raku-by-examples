use v6;

subset Length8    of Str where *.chars < 8;
subset UpCase     of Str where none('A'..'Z') ∈ *.comb.Set;
subset LowerCase  of Str where none('a'..'z') ∈ *.comb.Set;
subset IntNumber  of Str where none('0'..'9') ∈ *.comb.Set;

my $guess = prompt('Enter your password:');

given $guess {
    when Length8   { say '密码长度必须为 8 位 以上'; proceed }
    when  UpCase   { say '密码必须包括大写字母';     proceed }
    when LowerCase { say '密码必须包含小写字母';     proceed }
    when IntNumber { say '密码必须包含数字';                 }
}
