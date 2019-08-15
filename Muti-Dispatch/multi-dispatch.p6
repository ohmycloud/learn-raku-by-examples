# Operator overloading in Perl 6 will be done by multi-dispatch routines
# (In fact, all of the built-in operators are invoked by a multi-dispatch.

# Dispatch By Arity
# 􏰀 Arity = number of arguments that a routine takes
#􏰀  Could do the previous example as:

multi sub greet($name) {
    say "Ahoj, $name!";
}
multi sub greet($name, $greeting) {
    say "$greeting, $name!";
}
greet('Anna'); # Ahoj Anna 
greet('Лена', 'Привет '); # Привет, Лена"

# Type-Based Dispatch
#  􏰀 We can write types in a signature
#􏰀   They are used to help decide which candidate to call

multi sub double(Int $x) {
    return 2 * $x;
}
multi sub double(Str $x) {
    return "$x $x";
}
say double(21);      # 42
say double("he");   # he he
