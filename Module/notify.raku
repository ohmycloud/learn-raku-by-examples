use Notify;

react whenever Supply.interval(300) {
    my $c = ((DateTime.new('2022-04-01T15:00:00+08:00') - DateTime.now)/60).Int;
    
    my $notify = Notify.new(:title('购买返程车票'), :msg("距离开票时间还有: $c 分钟"), :msg-type('info'));
    $notify.notify();
}