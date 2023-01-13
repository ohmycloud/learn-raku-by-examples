my $p = Promise.start({ sleep 2; 42});
$p.then({ .result.say });   # will print 42 once the block finished 
say $p.status;              # OUTPUT: «Planned␤» 
$p.result;                  # waits for the computation to finish 
say $p.status;              # OUTPUT: «Kept␤»

# result 会等待 promise 变为 kept 或 broken, 并在 kept 时返回 promise 的值。

# start、in、at、anyof、allof、kept、broken 是 Promise 这个类型对象上的工厂方法
# 这些工厂方法确保 promise 自动为你 kept 或 broken, 你不能自己在这样的 promise 上调用 keep 或 break


# Promise.start 和 start 前缀语句是等价的

# start 语句创建了一个 Promise
# Creates a new Promise that runs the given code object. 
# The promise will be kept when the code terminates normally, or broken if it throws an exception. 
# The return value or exception can be inspected with the result method.
my $pp = start {
    sleep 2;
    42
};

# then 在 promise 完成后, 执行一个代码块
$pp.then({.result.say});
say $pp.status;

# Waits for the promise to be kept or broken. 
# If it is kept, returns the result; otherwise throws the result as an exception.
# result 方法等待 promise 兑现或失灵, 如果承诺兑现了, 则返回结果, 否则抛出异常。
$pp.result;
$pp.result;
$pp.result.say;
$pp.result.say;
say $pp.status;


my $promise = Promise.start(
    { my $i = 0; for 1 .. 10 { $i += $_ }; $i}
);
say $promise.result;    # OUTPUT: «55␤»