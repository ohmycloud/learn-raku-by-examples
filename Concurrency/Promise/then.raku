# Schedules a piece of code to be run after the invocant has been kept or broken, 
# and returns a new promise for this computation. In other words, creates a chained promise.

my $timer = Promise.in(2);
my $after = $timer.then({ say "2 seconds are over!"; 'result' });

say $after.result; # result `await` the promise until it kept or broken, if comment this line, nothing happens
# OUTPUT: «2 seconds are over␤result␤»