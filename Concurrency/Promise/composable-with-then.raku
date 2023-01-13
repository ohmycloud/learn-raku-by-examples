# 使用 then 组合 promise

my $promise1 = Promise.new();
my $promise2 = $promise1.then(
    -> $v { say $v.result; "Second Result" }
);

# keep 方法把 Promise 的状态改为 kept
$promise1.keep("First Result");
say $promise2.result;   # OUTPUT: «First Result␤Second Result␤»


# then 会在第一个 promise 为 kept 或 broken 时, 执行 then 里面的代码块
# 不管第一个 promise 是成功还是失败
# then 本身也会返回一个新的 promise
my $p1 = Promise.new();
my $p2 = $p1.then(-> $v { say "Handled but : "; say $v.result});

# 当原来的 promise 作为参数传递给 then 代码块, 并调用它的 result 方法时, 
# 这里的 break 会导致 then 代码块抛出异常, 这个异常随后导致第二个 promise 失败(broken)
$p1.break("First Result");
say "promise1 status = ", $p1.status;
try $p2.result;
say "promise2 status = ", $p2.status;  # Broken
say $p2.cause;   # OUTPUT: «Handled but : ␤First Result␤»