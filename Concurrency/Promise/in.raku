# Creates a new Promise that will be kept in $seconds seconds, or later.
# 创建一个会在 $seconds 秒后兑现的承诺

my $proc = Proc::Async.new('raku', '-e', 'sleep 10; warn "end"');
 
my $result = await Promise.anyof(
    my $promise = $proc.start,  # may or may not work in time 
    Promise.in(5).then: {       # fires after 5 seconds no matter what 
        unless $promise {       # don't do anything if we were successful 
            note 'timeout';
            $proc.kill;
        }
    }
).then: { $promise.result }
# OUTPUT: «timeout␤»


# Promise 也可以被安排在未来某个时刻自动 kept
# 5 秒后, 第一个 promise 自动被兑现，如果你自己手动 keep, 就报错:
#  拒绝兑现/破坏这个承诺, 因为已经发过誓了。
my $promise1 = Promise.in(5);
my $promise2 = $promise1.then(-> $v { say $v.status; 'Second Result' });
#$promise1.keep('manually kept'); # error if uncomment this line: Access denied to keep/break this Promise; already vowed
say $promise2.result;