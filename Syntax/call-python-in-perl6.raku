# The perl 6 solution to https://projecteuler.net/problem=34 converted
# to equivalent python. This may or may not be the most pythonic solution,
# but it is intended to demonstrate the approach.

# Magic toggle to Perl 6 code while parsing python:
[min] < 1 ;""">; # Begin perl code:
my $python;

# The perl 6:

sub fact ($n) {
    [*] 1..$n;
}

$python = q{ """ #Begin python code:

import operator

def fact(n):
    return reduce(operator.mul, xrange(1,n+1), 1)

""" }; # Begin perl code:

sub factDigits ($n is copy) {
    [+] gather while $n > 0 {
        take fact $n % 10;
        $n div= 10;
    }
}

$python = q{ """ #Begin python code:

def factDigits(i):
    # Both python and perl 6 could convert to string
    # but this approach is the one the perl 6 author
    # chose, and happens to work pretty much the same
    # in other bases, too which is nice.
    def _gen(n):
        while n > 0:
            yield fact(n % 10)
            n //= 10

    return sum(_gen(i))

""" }; # Begin perl code:

say [+] gather for 3...40586 {
    take $_ if factDigits($_) == $_
}

$python = q{ """ #Begin python code:

print sum((i for i in xrange(3, 40586+1) if factDigits(i) == i))

# Expected result is 40730

""" }; # """