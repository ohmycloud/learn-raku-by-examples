# Promise 的 in, at, all-of, any-of, start 等工厂方法会自动 keep promise
# 所以不用再手动调用 keep 方法了, 否则会说已经发过誓了, 拒绝
sub get_promise {
    my $promise = Promise.new;
    my $vow = $promise.vow;
    Promise.in(3).then({$vow.keep("Result")});
    $promise;
}
 
my $promise = get_promise();
say "[starting] promise status = ", $promise.status;
say $promise.result;
say "[ending] promise status = ", $promise.status;

# Will throw an exception 
# "Access denied to keep/break this Promise; already vowed" 
$promise.keep;
CATCH { default { say .^name, ': ', .Str } };
# OUTPUT: «X::Promise::Vowed: Access denied to keep/break this Promise; already vowed␤»