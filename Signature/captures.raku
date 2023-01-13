use v6;

# A set of parameters form a signature. 一组形参组成签名
# A set of arguments form a capture.    一组实参组成捕获

sub greet($name, :$greeting = 'Hi') {
    say "$greeting, $name!";
}
greet('Лена', greeting => 'Привет');