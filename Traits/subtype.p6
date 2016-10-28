sub divide(Int $a,
           Int $b where { $^n != 0 }) {
    return $a / $b;
}
say divide(120, 3); # 42
# say divide(100, 0); # Type check failure

# Here is an example of using subtypes to distinguish between two candidates

multi say_short(Str $x) {
    say $x;
}
multi say_short(Str $x
                  where { $_.chars >= 12 }) {
   say substr($x, 0, 10) ~ '...';
}
say_short("Beer!");         # Beer!
say_short("BeerBeerBeer!"); # BeerBeerBe...
