my Supply $s = Supply.from-list(^6);  # set up supply
my Supply $t = $s.throttle: 3,        # only allow 3 at a time
{                                     # code block to run
    say "running $_";                 # announce we've started
    sleep rand;                       # wait some random time
    say "done $_"                     # announce we're done
}                                     # don't need ; because } at end of line
$t.wait;                              # wait for the supply to be done