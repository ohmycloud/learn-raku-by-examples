role Serializable {
    method serialize() {
        self.perl; # very primitive serialization
    }
    method deserialization-code($buf) {
        EVAL $buf; # reverse operation to .perl
    }
}

class Point does Serializable {
    has $.x;
    has $.y;
}
my $p = Point.new(:x(1), :y(2));
my $serialized = $p.serialize;      # method provided by the role
my $clone-of-p = Point.deserialization-code($serialized);
say $clone-of-p.x;      # 1
