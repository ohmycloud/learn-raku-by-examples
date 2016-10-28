use v6;

my $bool1 = 1;
my $bool2 = 0;
given ($bool1, $bool2) {
    when (0, 0) {say "0, 0"}
    when (0, 1) {say "0, 1"}
    when (1, 0) {say "1, 0"}
    when (1, 1) {say "1, 1"}
}

given ("15", "example", "3.14") {
    say $_.WHAT; #  ("15", "example", "3.14") => List
    when ($, $, Str) { say "I got a String of $_[2]" }  # $ 代表一个匿名变量, 表示元组的前两个不参与智能匹配?
}

given (4, 5) {
    when ( $,  $) {say "Ok"}
}

given ("fly.mp3", 34, "It's funny") {
    when (/.mp3$/, /4$/, *.chars > 4) {say "Perfact"}
}

given 5 {
    when 1..10 {say "1..10 contains 5"}
}


# > (1,2, "SS") ~~ ($, $, Str)
# True
# > (1,2) ~~ (Int, $)
# True
# > (1,2) ~~ ($, $)
# True
# > (1,2) ~~ ($, Str)
