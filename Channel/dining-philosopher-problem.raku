#!/usr/bin/env perl6

my $table = Channel.new;
my @philosophers = (^5).map: -> $p {
    start {
        my $sips-left = 100;
        while $sips-left > 0 {
            my $spoon = $table.receive;
            say "Philosopher $p takes a sip with the $spoon.";
            $sips-left--;
            sleep rand;
            $table.send($spoon);
            sleep rand;
        }
    }
}
$table.send: 'wooden spoon';
$table.send: 'bamboo spoon';
await Promise.allof(@philosophers);