my ($ping, $pong) = Channel.new xx 2;
 
sub ping {
   while $ping.receive -> $n {
       say "ping $n (thread #{$*THREAD.id})";
       $pong.send: $n + 1;
   }
}
 
sub pong {
   while $pong.receive -> $n {
       last if $n >= 5;
       say "pong $n (thread #{$*THREAD.id})";
       $ping.send: $n + 1;
   }
}
 
$ping.send: 1;
await Promise.anyof(
 (start ping),
 (start pong)
);