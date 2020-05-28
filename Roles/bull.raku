role Bull-Like {
    has Bool $.castrated = False;
    method steer {
        # Turn your bull into a steer
        $!castrated = True;
        return self;
    }
}
role Steerable {
    has Real $.direction;
    method steer (Real $d = 0) {
        $!direction += $d;
    }
}
class Taurus does Bull-Like does Steerable {
    method steer ($!direction?) {
        self.Steerable::steer($!direction?);
    }
 }
