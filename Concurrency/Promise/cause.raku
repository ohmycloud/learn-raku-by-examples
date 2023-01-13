my $promise = Promise.start({ die "Broken Promise" });
say 'before result: ', $promise.status;
try $promise.result;
say 'after result: ', $promise.status;
say $promise.cause;

# cause 方法只能在 Broken 状态下的 promise 上调用
my $p = start {sleep 1; "successful"};
$p.result;
say $p.cause; #Can only call cause on a broken promise (status: Kept)