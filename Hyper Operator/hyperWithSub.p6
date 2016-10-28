use v6;

sub add($x) {
    sleep 3;    
    $x ** 2 + 1;
}
# hyper  运算符现在还未实现并行， 该程序 sleep 了 9 秒
my @array = 1, 3, 5;
.say for @array».&add;
