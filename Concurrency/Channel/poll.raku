my $c = Channel.new;
 
# Start three Promises that sleep for 1..3 seconds, and then 
# send a value to our Channel 
^3 .map: -> $v {
    start {
        sleep 3 - $v;
        $c.send: "$v from thread {$*THREAD.id}";
    }
}
 
# Wait 3 seconds before closing the channel 
Promise.in(3).then: { $c.close }
 
# Continuously loop and poll the channel, until it's closed 
# The method closed returns a Promise that will be kept 
# (and consequently will evaluate to True in a Boolean context) when the channel is closed.
my Promise $is-closed = $c.closed;
loop {
    if $c.poll -> $item {
        say "$item received after {now - INIT now} seconds";
    }
    elsif $is-closed {
        last; # channel 关闭则退出循环
    }
 
    say 'Doing some unrelated things...';
    sleep .6;
}
 
# Doing some unrelated things... 
# Doing some unrelated things... 
# 2 from thread 5 received after 1.2063182 seconds 
# Doing some unrelated things... 
# Doing some unrelated things... 
# 1 from thread 4 received after 2.41117376 seconds 
# Doing some unrelated things... 
# 0 from thread 3 received after 3.01364461 seconds 
# Doing some unrelated things...