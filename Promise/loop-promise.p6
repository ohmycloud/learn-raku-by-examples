#!/usr/bin/env perl6

# https://stackoverflow.com/questions/61495584/user-input-with-timeout-doesnt-work-as-hoped
loop {
    my $str;
    my $timeout = Promise.in( 5 ).then({
        $str = 'Timeout';
    });
    my $user = Promise.start({
        $str = prompt '> ';
    });
    await Promise.anyof( $timeout, $user );
    if $str eq 'q' {
        last;
    }
    say "[$str]";
}