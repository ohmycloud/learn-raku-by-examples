#!/usr/bin/env perl6

grammar Enhanced-Paragraph {
    token TOP { <superword>[ (\s+) <superword>]+ }
    token superword { <word> | <enhanced-word> }
    token word { \w+ }
    token enhanced-word { \* <word> \* }
}

sub MAIN ( Str $paragraph ) {
    my $parsed = Enhanced-Paragraph.parse($paragraph);
    say $parsed;
}


