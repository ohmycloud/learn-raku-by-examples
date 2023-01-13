# Creates a new Promise that will be kept $at the given time
# which is given as an Instant or equivalent Numeric—or as soon as possible after it.

my $p = Promise.at(now + 2).then( { say "2 seconds later" } );
say "starting";
await $p; # wait here until the 2 seconds are over, await 会阻塞, 直到 2 秒后 promise 被兑现
say "ending";