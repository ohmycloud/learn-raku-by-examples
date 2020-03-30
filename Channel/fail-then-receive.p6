#!/usr/bin/env perl6

my $channel = Channel.new;
$channel.send: $_ for <Hamadryas Rhamma Melanis>;
put 'Received: ', $channel.receive;
$channel.fail('End of items');   # X::AdHoc

loop {
    CATCH {
        default { put "Channel is closed"; last }
    }
    put "loop received: ", $channel.receive;
}