# :$foo;  # same as :foo($foo)
# :$*foo; # same as :foo($*foo)
# :$?foo; # same as :foo($?foo)
# :$.foo; # same as :foo($.foo)
# :$!foo; # same as :foo($!foo)
# :@foo;  # same as :foo(@foo)
# :@*foo; # same as :foo(@*foo)
# :@?foo; # same as :foo(@?foo)
# :@.foo; # same as :foo(@.foo)
# :@!foo; # same as :foo(@!foo)
# :%foo;  # same as :foo(%foo)
# :%*foo; # same as :foo(%*foo)
# :%?foo; # same as :foo(%?foo)
# :%.foo; # same as :foo(%.foo)
# :%!foo; # same as :foo(%!foo)
# :&foo;  # same as :foo(&foo)
# :&*foo; # same as :foo(&*foo)
# :&?foo; # same as :foo(&?foo)
# :&.foo; # same as :foo(&.foo)
# :&!foo; # same as :foo(&!foo)


my %foo = [1,2,3] Z=> 4,5,6;

my &foo = -> $i { $i ** 3};
sub r(:%foo) {
    say %foo;
}

r(:%foo);


class Person {
    has $.name is rw;
    has $!age = 19;

    method run() { say $!name ~ $!age }
    method test(:$.name) {
        say $.name;
    }
}

my $p = Person.new(:name<foo>);
$p.run();
$p.test();
