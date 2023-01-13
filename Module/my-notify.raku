use Notify;

my $notify = Notify.new(:title('💖 已工作45分钟'), :msg('休息一下，马上回来！'), :msg-type('important'));

react whenever Supply.interval(1200) {
    $notify.notify();
}
