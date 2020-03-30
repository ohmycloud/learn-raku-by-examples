class Rule {
    has Regex:D $.matcher is required;
    has         &.parser  is required;

    method new(::?CLASS:_: Regex:D $matcher, &parser) {
        self.bless: :$matcher, :&parser
    }

    method match(::?CLASS:D: Str:D $target --> Replier:_) {
        $target ~~ $!matcher;
        $/.defined ?? &!parser(self, $/) !! Nil
    }
}

grammar Foo::Grammar {
    token TOP { <foo> }

    proto token foo          {*}
    token foo:sym<foo> { <sym> }

    method ^parameterize(Foo::Grammar:U $this is raw, Mu $grammar-role is raw --> Foo::Grammar:U) {
        my Foo::Grammar:U $mixin := $this.^mixin: $grammar-role;
        $mixin.^set_name: $this.^name ~ '[' ~ $grammar-role.^name ~ ']';
        $mixin
    }
}

class Foo::Actions {
    method TOP($/) { make $<foo>.made; }

    method foo:sym<foo>($/) { make ~$<sym>; }

    method ^parameterize(Foo::Actions:U $this is raw, Mu $actions-role is raw --> Foo::Actions:U) {
        my Foo::Actions:U $mixin := $this.^mixin: $actions-role;
        $mixin.^set_name: $this.^name ~ '[' ~ $actions-role.^name ~ ']';
        $mixin
    }
}

role Bar::Grammar {
    token foo:sym<bar> { <sym> }
}

role Bar::Actions {
    method foo:sym<bar>($/) { make ~$<sym>; }
}

Foo::Grammar.subparse: 'foo', actions => Foo::Actions.new;
say $/ && $/.made; # OUTPUT: foo
Foo::Grammar.subparse: 'bar', actions => Foo::Actions.new;
say $/ && $/.made; # OUTPUT: #<failed match>

Foo::Grammar[Bar::Grammar].subparse: 'foo', actions => Foo::Actions[Bar::Actions].new;
say $/ && $/.made; # OUTPUT: foo
Foo::Grammar[Bar::Grammar].subparse: 'bar', actions => Foo::Actions[Bar::Actions].new;
say $/ && $/.made; # OUTPUT: bar

# https://stackoverflow.com/questions/59426167/how-can-you-write-a-customizable-grammar