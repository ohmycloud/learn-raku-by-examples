use v6;

my  @primes=<1 3 5 7 9 11 13 15 17>;
say @primes;                       # all values as list
say @primes.values;                # same thing
say @primes.keys;                  # list of all indices
say "@primes[]";                   # insert all values in a string, uses [] as distinction from mail adresses
my  $prime = @primes[0];           # get the first prime
say $prime;

my $last_prime = @primes[*-1];    # get the last one
say $last_prime;

my @some = @primes[2..5];         # get several
say @some;

my @data   = [1..5],[6..10],[11..15];  # Array of Arrays (AoA)
my $cell = @data[1][2];                # get 8, third value of second value (list)
say $cell;

my  $same_cell = @data[1,2];           # same thing, shorten syntax
say $same_cell;                        # 6 7 8 9 10 11 12 13 14 15

my @numbers = @data[1];                # get a copy of the second subarray (6..10)
say @numbers;
my @copy = @data;                      # copy the whole AoA, no more reference passing, use binding instead
say @copy.perl;
