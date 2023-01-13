#!/usr/bin/env perl6

use experimental :will-complain;

sub MAIN() {
    my subset MyIntD of Int:D
                   will complain { "only non-zero positive integers, not {.raku}" }
    where * > 0;

    sub test(MyIntD $number) {
        say $number;
    }

    #test(-2);

    subset IntKey of Int will complain { "hash key must be an Int" };
    my %h{IntKey};
#    %h<a> = 13;

    my class Bar
            will complain -> $val { "need something Bar-like, got {$val.^name}" } {}

}

