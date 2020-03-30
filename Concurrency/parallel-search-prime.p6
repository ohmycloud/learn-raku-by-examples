#!/usr/bin/env perl6

.say for (1..*)
        .hyper(batch => 512, degree => 6)
        .grep(-> $n { $n.is-prime && $n eq $n.flip }) .head(100);