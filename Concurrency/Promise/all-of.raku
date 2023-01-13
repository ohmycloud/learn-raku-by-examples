# Returns a new promise that will be kept when all the promises passed as arguments are kept or broken. 
# The result of the individual Promises is not reflected in the result of the returned promise: 
# it simply indicates that all the promises have been completed in some way. 
# If the results of the individual promises are important then they should be inspected after the allof promise is kept.
# In the following requesting the result of a broken promise will cause the original Exception to be thrown. 
# (You may need to run it several times to see the exception.)

my @promises;
for 1..5 -> $t {
    push @promises, start {
        sleep $t;
        $t
    };
}
my $all-done = Promise.allof(@promises);
await $all-done;
say "staring";
@promises>>.result>>.say;
say "Promises kept so we get to live another day!";


# await 是阻塞的, 它一直等待, 阻塞了当前的线程
my $promise = Promise.allof(
    Promise.in(2),
    Promise.in(3)
);

say "[staring] promise status = ", $promise.status; 
await $promise;
say "[ending] promise status = ", $promise.status;
say "All done"; # Should be not much more than three seconds late