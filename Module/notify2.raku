use Notify;

react whenever Supply.interval(1800) {
    my $notify = Notify.new(:title('Take a break'), :msg('You\'ve been working for 30 minutes'), :msg-type('info'));
    $notify.notify();
}