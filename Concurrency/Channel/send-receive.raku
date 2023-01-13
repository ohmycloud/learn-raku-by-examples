my $channel = Channel.new;

for 1..5 {
    $channel.send('Channel One: ' ~ $_);
}

say $channel.receive;

say "--- [closing channel] ---";
$channel.close;

# The method list returns all the items on the Channel and will block 
#  until further items are queued unless the channel is closed:
for $channel.list -> $r {
    $r.say
}

# 向已经关闭的 Channel 发送数据会抛出 X::Channel::SendOnClosed 异常
# say $channel.receive; # Cannot receive a message on a closed channel


my $c = Channel.new;
await (^10).map: -> $r {
    start {
        sleep ⅓ + rand;
        $c.send($r);
    }
}

$c.close;
for $c.list -> $r {
    say $r;
}