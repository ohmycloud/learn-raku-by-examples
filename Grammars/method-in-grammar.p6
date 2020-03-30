#!/usr/bin/env perl6

grammar DigitMatcher {
    method TOP (:$full-unicode) {
        $full-unicode ?? self.num-full !! self.num-basic;
    }
    token num-full  { \d+ }
    token num-basic { <[0..9]>+ }
}

say +DigitMatcher.subparse: '12७१७९०९', args => \(:full-unicode);
# OUTPUT: «12717909␤»

say +DigitMatcher.subparse: '12७१७९०९', args => \(:!full-unicode);
# OUTPUT: «12␤»