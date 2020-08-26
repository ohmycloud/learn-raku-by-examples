#!/usr/bin/env perl6

my $t2 = Thread.new:
        name => 'Another task',
        code => sub {
            loop {
                say 'stuff';
                sleep 1;
            }
        },
        ;

# The thread does not start until we...
$t2.run;

# And then we'd better wait for it or we'll exit immediately
$t2.finish;

# Output:
# stuff
# stuff
# stuff
# ...