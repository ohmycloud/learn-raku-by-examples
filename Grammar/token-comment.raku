#!/usr/bin/env raku
use v6.d;

my $text = q:to/END/;
---++Foo
This line belongs to a paragraph
And this is another line

---++ Bar
This line belongs to another paragraph
And this is another line too
END

grammar Paragraph {
    token TOP { <paragraph>+ }
    token paragraph {
        (
        || <header>
        || <regular>
        )
        \n*
    }

    token header { ^^ '---' '+'**1..5 ' ' }
    token regular { \N+ }
}

my $match = Paragraph.parse($text);
say $match<paragraph>[0];

