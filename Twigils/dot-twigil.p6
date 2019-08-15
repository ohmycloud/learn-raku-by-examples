 class Point {
        has $.x;
        has $.y;

        method Str() {
           return ($.x, $.y); # 注意我们这次使用 . 而不是 !
        }
    }

my $p = Point.new(x=>10,y=>20);
my ($height,$wide) = $p.Str();
say "高度:$height";
say "宽度:$wide";


 class SaySomething {
        method a() { say "a"; }
        method b() { say $.a; }
    }

    SaySomething.a; # prints "a"
    SaySomething.b;
