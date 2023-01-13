# Channels can be used in place of the Supply in the whenever of a react block

my $channel = Channel.new;
my $p = start {
    react {
        whenever $channel {
            say $_;
        }
    }
}
 
await (^5).map: -> $r {
    start {
        sleep $r;
        $channel.send($r);
    }
}
 
$channel.close;
await $p;