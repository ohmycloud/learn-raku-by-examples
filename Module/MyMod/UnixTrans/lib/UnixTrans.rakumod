use v6.c;
unit class UnixTrans:ver<0.0.1>;

class Convert {
    has &.formatter =  sub formatter($_) {
        sprintf '%04d-%02d-%02d %02d:%02d:%02d',
                .year, .month,  .day,
                .hour, .minute, .second
    };

    has $.timestamp;
    has $.date;
    has $.time;

    method unix2time() {
        my $ts = $!timestamp.chars == 13 ?? $!timestamp.substr(0,10) !! $!timestamp;
        given DateTime.new(+$ts, :&!formatter).in-timezone(8*3600) {
            when .Date.DateTime eq $_ { say .Date }
            default { .say }
        }
    }

    method time2unix() {
        my $d = Date.new($!date);
        if $!time {
            my ( $hour, $minute, $second ) = $!time.split(':');
            say DateTime.new(date => $d, :$hour, :$minute, :$second).posix - 28800;
        }
        else {
            say $d.DateTime.posix - 28800;
        }
    }
}



=begin pod

=head1 NAME

UnixTrans - blah blah blah

=head1 SYNOPSIS

=begin code :lang<perl6>

use UnixTrans;

=end code

=head1 DESCRIPTION

UnixTrans is ...

=head1 AUTHOR

 <>

=head1 COPYRIGHT AND LICENSE

Copyright 2019 

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
