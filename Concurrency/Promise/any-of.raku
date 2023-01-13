# Returns a new promise that will be kept as soon as any of the promises passed as arguments is kept or broken. 
# The result of the completed Promise is not reflected in the result of the returned promise which will always be Kept.
# You can use this to wait at most a number of seconds for a promise:

my $timeout = 5;
my @promises;

my $p1 = Promise.in($timeout);
my $p2 = start { sleep 3; 42};

say "starting";
await Promise.anyof(|@promises);
@promises>>.result>>.say;
say "ending";


my $promise = Promise.anyof(
    Promise.in(3),
    Promise.in(8600)
);


say "[staring] promise status = ", $promise.status; # Planned
await $promise;
say "[ending] promise status = ", $promise.status;  # Kept
say "All done"; # Should be about 3 seconds later