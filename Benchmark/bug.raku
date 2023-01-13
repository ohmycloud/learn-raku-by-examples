my \A = 1000_000;
constant B = 1000_000;

subset C of Int where * < A;
subset D of Int where * < B;

sub a(Int $a where * < A) {
    say $a;
}

sub b(Int $a where * < B) {
    say $a;
}

sub c(C $a) {
    say $a;
}

sub d(D $a) {
    say $a;
}

a(1);
b(1);
c(1);
d(1);