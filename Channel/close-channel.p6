#!/usr/bin/env perl6

my $channel = Channel.new;
$channel.send: 'Hamadryas';
put 'Received: ', $channel.receive;
$channel.close;