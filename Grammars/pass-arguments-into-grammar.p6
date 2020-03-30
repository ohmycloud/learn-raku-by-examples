#!/usr/bin/env perl6

grammar demonstrate-arguments {
    rule TOP ($word) {
        "I like" $word
    }
}

# Notice the comma after "sweets" when passed to :args to coerce it to a list
say demonstrate-arguments.parse("I like sweets", :args(("sweets",)));
# OUTPUT: «｢I like sweets｣␤»

grammar demonstrate-arguments-again {
    rule TOP ($word) {
        <phrase-stem><added-word($word)>
    }

    rule phrase-stem {
        "I like"
    }

    rule added-word($passed-word) {
        $passed-word
    }
}

say demonstrate-arguments-again.parse("I like vegetables", :args(("vegetables",)));
# OUTPUT: ｢I like vegetables｣␤»
# OUTPUT:  «phrase-stem => ｢I like ｣␤»
# OUTPUT:  «added-word => ｢vegetables｣␤»