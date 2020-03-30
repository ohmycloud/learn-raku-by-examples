#!/usr/bin/env perl6

my $channel = Channel.new;
$channel.send: $_ for <Hamadryas Rhamma Melanis>;
put 'Received: ', $channel.receive;
$channel.fail('End of items');

$channel.Supply.tap: { put "Received $_" }
CATCH { default { put "Channel is closed" } }