role Paintable {
    has $.colour is rw;
    method paint { ... }
}
class Shape {
    method area { ... }
}

class Rectangle is Shape does Paintable {
    has $.width;
    has $.height;
    method area {
        $!width * $!height;
    }
    method paint() {
        for 1..$.height {
            say 'x' x $.width;
        }
    }
}

Rectangle.new(width => 8, height => 3).paint;
# 这打印下面 3 行
xxxxxxxx
xxxxxxxx
xxxxxxxx
