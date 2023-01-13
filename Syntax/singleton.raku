class Singleton {
    my Singleton $instance = Singleton.new;
    method BUILD {
        say "BUILD";
    }
    method get-instance {
        return $instance;
    }
}

my $obj1 = Singleton.get-instance;
my $obj2 = Singleton.get-instance;

if $obj1 === $obj2 {
    say $obj1.WHICH; # Singleton|130940864
    say $obj2.WHICH; # Singleton|130940864
    say '====';
} else {
    say '!===';
}
