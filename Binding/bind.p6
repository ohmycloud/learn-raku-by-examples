use v6;

my @a := 1..Inf;
say @a[^10]; # 1 2 3 4 5 6 7 8 9 10 

my @primes  := @a.grep(*.is-prime); 
say @primes[^10]; # 2 3 5 7 11 13 17 19 23 29

my @nprimes := @primes.map({ "{++state $n}: $_" }); 
.say for @nprimes[^10]; 

.say for (1..Inf 
    ==> grep(*.is-prime) 
    ==> map({ "{++state $n}: $_" }) 
    )[^10]; 
	
