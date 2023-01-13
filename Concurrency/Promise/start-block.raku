my $promise = start {
    my $sum = 0;
    for 1..100 {
        $sum += $_
    }
    $sum
};

# await 方法等待 promises 被兑现或破坏, 然后返回 promise 的结果
# await 几乎和 result 方法一样, 但是它可以 await 多个 promise
#my $result = await $promise;
#say $result;

# result 方法等待 promise 被兑现或破坏, 然后返回 promise 的结果
$promise.result.say; 