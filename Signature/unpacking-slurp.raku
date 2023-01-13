sub slurp-in-array(@ [$fst, *@rest]) { # You could keep `*@rest` anonymous
  say $fst + @rest.elems;   # `.elems` returns a list's length.
                            # Here, `@rest` is `(3,)`, since `$fst` holds the `2`.
}
my @array = <2 3 4 5>;
slurp-in-array(@array);
