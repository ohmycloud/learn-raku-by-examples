class A {
    has $.value = 42;
    method TWEAK(:$value = 0) { # default prevents warning
        # change the attribute if the default value is specified
        $!value = 666 if $value == $!value;
    }
}
# no value specified, it gets the default attribute value
dd A.new;              # A.new(value => 42)

# value specified, but it is not the default
dd A.new(value => 77); # A.new(value => 77)

# value specified, and it is the default
dd A.new(value => 42); # A.new(value => 666)
