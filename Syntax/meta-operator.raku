# See https://stackoverflow.com/questions/67593608/
# is-it-possible-to-chain-metaoperators-to-calculate-the-product-sum-of-two-lists


say my @a = 2...6;          # [2 3 4 5 6]
say my @b = 5...1;          # [5 4 3 2 1]



say [+] [Z*]             @a, @b;  # 50  (closest to what it seems you want)
say sum [Z*]             @a, @b;  # 50  (`sum` is idiomatic)
say sum zip :with(&[*]), @a, @b;  # 50  (some prefer `zip :with(&[*])` over `[Z*]`)
say sum product          @a, @b;  # 50  (requires a user defined `sub`)

sub product (|lists) { zip :with(&[*]), |lists }



say [+] @a  Z*   @b;      # 50    (using infix sequential shallow zip metaop)
say [+] @a >>*<< @b;      # 50    (using infix parallel nesting hyper metaop)

say sum @a  Z*   @b;      # 50    (replacing `sum` with `[+]` reduction)
say sum @a >>*<< @b;      # 50



say [+] [5,4,3,2,1];        # 15
                            # Same as:
say sum @b;                 # 15


say 2               Z* 15;  # (30)
                            # zip stops once shortest list exhausted, so same as:
say [2,3,4,5,6] Z* 15;      # (30)


say +@b;                    # 5
                            # `+` coerces argument(s) to number, so short for:
say elems @b;               # 5
                            # Same as:
say elems [5,4,3,2,1];      # 5


say 2 Z* 5;                 # (10)


#say +foo;                  # Error while compiling: Undeclared ... foo
                            # Same effect as:
#say foo;                   # Error while compiling: Undeclared ... foo


say [Z*] @b;                # (120)
                            # Same as:
say 5 Z* 4 Z* 3 Z* 2 Z* 1;  # (120)


say @a         [Z*] 5;      # (10)
                            # square brackets redundant, and
                            # zip stops once shortest list exhausted, so same as:
say 2           Z*  5;      # (10)


say [+] @a >>*<< @b;        # 50


say [>>*<<] @b;             # 120
                            # hypers redundant if both args scalars, so same as:
say   [*]   [5,4,3,2,1];    # 120
                            # (5 * 4 * 3 * 2 * 1)


say @a [+] [>>*<<] @b;      # 125
                            # square brackets round infix `+` redundant, so same as:
say @a  +  [>>*<<] @b;      # 125
                            # hypers redundant if both args scalars, so same as:
say 5   +    [*]   @b;      # 125      (5 + 120)


#say @a [>>*<<][+]  @b;     # Same as:
#say @a [>>*<<] [+] @b;     #
#say @a [>>*<<] sum @b;     #
#say @a  >>*<<  sum @b;     #
#say @a  >>*<<  15;         # Lists on either side ... not of the same length