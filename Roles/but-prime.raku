constant MAX-NUM = 10_000;
my @these-primes = (^(MAX-NUM/2)).grep: *.is-prime;
sub is-mod( $n, $b ) { ! ($n mod $b) }
my @modders = @@these-primes.map: -> $b { ( -> $c { is-mod( $c, $b ) } ) but $b };

for 2..5000 -> $n {
    say $n, " ", ($_.Int ~ " " for @modders.grep: { $_($n) } ).join(", ");
}
=finish

分解质因数:
 modders is array of blocks that check if its arguments is divisible by $x,
  and those blocks have $x as a role so that, once we get the list of blocks that check out, we can retrieve the factor $x.