use v6;

my @a=<aa bb cc dd ee ff >;

for @a -> $x,$y,$z {
    say $x,$y,$z;
}
say $*PROGRAM_NAME;

# aabbcc
# ddeeff
# three.p6
