use v6;

my @d =  ( [ 1 .. 3 ] );
@d.append( [ 4 .. 6 ] );
@d.append( [ 7 .. 9 ] );

for @d -> $item {
    say "$item[]";
}
@d.perl.say;
