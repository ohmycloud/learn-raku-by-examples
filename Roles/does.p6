role Serializable {
    method serialize() {
        self.perl; # very primitive serialization
    }
    method deserialize($buf) {
        EVAL $buf; # reverse operation to .perl
    }
}

class Point does Serializable {
    has $.x;
    has $.y;
}
my $p = Point.new(:x(1), :y(2));
my $serialized = $p.serialize;      # method provided by the role
say $serialized;
my $clone-of-p = Point.deserialize($serialized);
say $clone-of-p.x;      # 1
