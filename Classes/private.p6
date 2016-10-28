use v6;

class Point {
    has $.x;
    has $!y;


    method print() {
        say self.x(); # 调用实例的名为 x 的方法
        say $!y;
    }
}

my $point = Point.new(x => 10, y => 20);
$point.print;
