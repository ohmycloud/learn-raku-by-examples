#! /usr/bin/env perl6
use v6;

multi serialize ($value where Numeric|Str|Bool) {
    $value.perl;
}

multi serialize ($value where List|Array|Hash) {
    '(' ~
    $value.pairs.map({
        serialize(.key) ~ ':' ~ serialize(.value)
    }).join(', ')
    ~ ')';
}

say serialize(1);
say serialize('a');
say serialize([1,'b',3]);
say serialize({a=>1, b=>22, c=>[3,3,3]});
