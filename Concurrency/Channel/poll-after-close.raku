#!/usr/bin/env perl6

my $channel = Channel.new;
$channel.send: $_ for <Hamadryas Rhamma Melanis>;
put 'Received: ', $channel.receive;
$channel.close;

while $channel.poll -> $thingy {
    put 'while received $thingy';
}