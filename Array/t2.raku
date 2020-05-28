sub sieve($n) {
        my buf8 $composite := buf8.allocate($n);
        my int $t = 3;
        while (my $q := $t * $t) <= $n {
            unless $composite[$t] {
                my int $t2 = $t + $t;
                my int $s  = $q - $t2;
                $composite[$s] = 1 while ($s = $s + $t2) <= $n;
            }
            $t = $t + 2;
        }
        my int @result = 2;
        $t = 1;
        @result.push($t) unless $composite[$t] while ($t = $t + 2) <= $n;
        @result
    }

my $N = 5000000;
my $start = time;
my @primes = sieve($N);
my $end = time;

print @primes[*-1], "\n";
printf "%.2fs\n", $end - $start;
