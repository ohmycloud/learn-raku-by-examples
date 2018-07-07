#!/usr/bin/env perl6

use v6;

sub MAIN( $path = ".", $extension = "p6" ) {
    my DateTime $right = DateTime.now;
    my %metadata;
    my %files-month;
    my %files-period;
    for dir($path).grep( / \.$extension $/ ) -> $file {
        CATCH {
            when X::Temporal { say "Date-related problem", .payload }
            when X::IO { say "File-related problem", .payload }
            default { .payload.say }
        }
        my Instant $modified = $file.modified;
        my Instant $accessed = $file.accessed;
        my Duration $duration = $accessed - $modified;
        my $age = $right - DateTime($accessed);
        my $time-of-day = $file.changed.DateTime.hh-mm-ss but Dateish;
        say $time-of-day.^name;
        my $file-changed-date =  $file.changed.Date;
        %metadata{$file} = %( modified => $modified,
                              accessed => $accessed,
                              age => $age,
                              difference => $duration,
                              changed-tod => $time-of-day,
                              changed-date => $file-changed-date);
        %files-month{$file-changed-date.month}++;
        given $file-changed-date {
            when Date.new("2018-01-01")..^Date.new("2018-04-01") { %files-period<pre-grant>++}
            when Date.new("2018-04-01")..Date.new("2018-05-31") { %files-period<grant>++}
            default { %files-period<post-grant>++};
        }
    }

    %metadata.sort( { $^a.value<age> <=> $^b.value<age> } ).map: {
        say $^x.key, ", ",
        $^x.value<accessed modified age difference changed-tod changed-date>.join(", ");
    };
    %files-month.keys.sort.map: {
        say "Month $^x → %files-month{$^x}"
    };

    %files-period.keys.map: {
        say "Period $^x → %files-period{$^x}"
    };
}


    
