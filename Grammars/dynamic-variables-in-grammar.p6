#!/usr/bin/env perl6

grammar GrammarAdvice {
    rule TOP {
        :my Int $*USE-WS;
        "use" <type> "for" <significance> "whitespace by default"
    }
    token type {
        | "rules"   { $*USE-WS = 1 }
        | "tokens"  { $*USE-WS = 0 }
        | "regexes" { $*USE-WS = 0 }
    }
    token significance {
        | <?{ $*USE-WS == 1 }> "significant"
        | <?{ $*USE-WS == 0 }> "insignificant"
    }
}

say GrammarAdvice.subparse("use rules for significant whitespace by default");
# OUTPUT: «use rules for significant whitespace by default»

say GrammarAdvice.subparse("use tokens for insignificant whitespace by default");
# OUTPUT: «use tokens for insignificant whitespace by default»

say GrammarAdvice.subparse("use regexes for insignificant whitespace by default");
# OUTPUT: «use regexes for insignificant whitespace by default»

say GrammarAdvice.subparse("use regexes for significant whitespace by default");
# OUTPUT: #<failed match>


grammar demonstrate-arguments-dynamic {
    rule TOP ($*word, $*extra) {
        <phrase-stem><added-words>
   }
    rule phrase-stem {
        "I like"
   }
    rule added-words {
        $*word $*extra
    }
}

say demonstrate-arguments-dynamic.parse("I like everything else",
        :args(("everything", "else")));
# OUTPUT: «｢I like everything else｣␤»
# OUTPUT:  «phrase-stem => ｢I like ｣␤»
# OUTPUT:  «added-words => ｢everything else｣␤»













