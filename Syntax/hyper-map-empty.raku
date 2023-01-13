sub needle(int \b) {
    sub is-pentagon($c is raw) { (1+sqrt(1+24*$c))%%6 }
    sub P($n is raw) { $n*(3*$n-1) div 2 }

    loop (my int $s = 1; $s < b; $s++) {
        my \bp = P(b);
        my \sp = P($s);
        if is-pentagon(bp + sp) && is-pentagon(bp - sp) {
            return |(b, $s);
        }
    }
}

sub infix:<notnilor>(\maybenil, \alternative) {
    maybenil =:= Nil ?? alternative !! maybenil
}

#say (^∞).hyper(:batch(8), :degree(16)).map({.&needle notnilor Empty }).head;

my atomicint $steps;
say (^∞).hyper(:batch(8), :degree(12)).map({$steps⚛++; .&needle notnilor Empty }).head;
say $steps;
