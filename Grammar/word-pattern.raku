#!/usr/bin/env raku
use v6.d;

grammar WordPattern {
    token TOP  { <word>+ % \s+ }
    token word { (\w+) }
}

my $text = "The quick brown fox jumps over the lazy dog";
my $match = WordPattern.parse($text);
.Str.say for $match<word>;

grammar EmailPattern {
    token TOP         { [<word>|<email>]+ % \s+ '.' }
    token word        { \w+                         }
    token dotted-name { <word>+ % '.'               }
    token email       { <dotted-name>+ % '@'        }
}

$text = "My email is my.name@example.com.";
$match = EmailPattern.parse($text);

for $match<email> {
    .Str.say for .<dotted-name>;
}