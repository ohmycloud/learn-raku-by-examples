grammar Bar {
    token TOP { <alpha> }
}

class BarActions {
    method TOP ($/) { make "*$/*" }
}

grammar Foo {
    token TOP {
        [ <digit> | <bar=.foreign(Bar, BarActions)> ]+
    }
    method foreign ($grammar, $actions?) { 
        $grammar.subparse(self.orig, :$actions, :pos(self.to));
    }
}

class FooActions {
    method TOP ($/) { make $<bar>».made }
}

my $a = Foo.parse: '1a2b', :actions(FooActions);
say $a;
say $a.made; # [*a* *b*]