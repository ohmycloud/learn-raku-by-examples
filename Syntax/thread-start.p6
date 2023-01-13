#!/usr/bin/env perl6

my $t = Thread.start:
        name => 'Background task',
        :app_lifetime,
        sub {
            if rand > 0.5 { say 'weeble' }
            else { say 'wobble' }
        },
        ;

say "Starting $t.id(): $t.name()";
say "Main App Thread is $*THREAD.id(): $*THREAD.name()";

$t.finish; # wait for the thread to stop

# Output:
# Starting 4: Background task
# weeble
# Main App Thread is 1: Initial thread