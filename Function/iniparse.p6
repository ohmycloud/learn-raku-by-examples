use v6;

grammar INIFile::Grammar {
    token TOP {
        ^
        [
        | <entry> \n
        | \n
        ]+
        $
    }
    token entry { <key> \h* '=' \h* <value> }
    token key   { \w+                       }
    token value { \N+                       }
}

my $m := INIFile::Grammar.parse(Q{
name = Animal Facts
author = jnthn
});

say $m;
