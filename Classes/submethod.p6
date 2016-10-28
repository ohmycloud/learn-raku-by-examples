class Point2D {
    has $.x;
    has $.y;

    submethod BUILD(:$!x, :$!y) {
        say "Initalizing Point2D";
    }
}

class InvertiblePoint2D is Point2D {
    submethod BUILD() {
        say "Initilizing InvertiblePoint2D";
    }
    method invert {
        self.new(x => - $.x, y => - $.y);
    }
}

say InvertiblePoint2D.new( x => 1, y => 2);

