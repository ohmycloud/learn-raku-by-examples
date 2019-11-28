#!/usr/bin/env perl6

# infinite loop
for (-9, -6 ... 0, 2 , 4 ... 10).rotor( 2 => -1) {
    .join(',').trans(/^/ => '[', /$/ => ')' ).say;
}

# infinite loop
'aabcc'.trans: /<(/ => '-';

say 'aabcc'.trans: /a<(/ => '-';  # a-a-bcc
say 'aabcc'.trans: /a<(a/ => '-'; # a-bcc

for (-9, -6 ... 0, 2 , 4 ... 10).rotor( 2 => -1) {
    .join(',')
    .subst(/^/, '[' )
    .subst(/$/, ')' )
    .say;
}
