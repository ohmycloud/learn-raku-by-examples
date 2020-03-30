#!/usr/bin/env perl6

grammar Digifier {
    rule TOP {
        [ <.succ> <digit>+ ]+
    }
    token succ   { <?> }
    token digit { <[0..9]> }
}

class Devanagari {
    has @!numbers;
    method digit ($/) { @!numbers.tail ~= <零 一 二 三 四 五 六 七 八 九>[$/] }
    method succ  ($)  { @!numbers.push: ''     }
    method TOP   ($/) { make @!numbers[^(*-1)] }
}

say Digifier.parse('255 435 777', actions => Devanagari.new).made;
# OUTPUT: 二五五 四三五 七七七