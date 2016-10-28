#!/usr/bin/perl6
use v6;

sub MAIN( $string ){                   # 1
    my $p = run 'ps', 'auxww', :out;   # 2
    my $header = $p.out.get;           # 3
    say $header, '-' x 80;             # 4

    for $p.out.lines {                 # 5
        next unless m/ $string /;      # 6
        .trim;                         # 7
        my @v = .words;                # 8
        next if @v[1] == $*PID;        # 9
        .say;                          # 10
    }
    say '-' x 80, $header;             # 11
}