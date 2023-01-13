my $channel = Channel.new;
start   { react whenever $channel { say $_ }}
for ^10 { $channel.send($_) }
sleep 1
