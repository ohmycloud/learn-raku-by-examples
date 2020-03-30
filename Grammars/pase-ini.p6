#!/usr/bin/env perl6

my Str $example = q:to/INI/;
access=user
;; more details of user below
[person]
name=john doe
address=555 Canndy Lane
INI

grammar IniFile {
    token key     { \w+ }
    token value   { <!before \s> <-[\n;]>+ <!after \s> }
    token pair    { <key> \h* '=' \h* <value> \n+      }
    token header  { '[' <-[ \[ \] \n ]>+ ']' \n+       }
    token comment { ';' \N*\n+                         }
    token block   { [<pair> | <comment>]*              }
    token section { <header> <block>                   }
    token TOP     { <block> <section>*                 }
}

class IniFile::Actions {
    method key($/)     { make $/.Str }
    method value($/)   { make $/.Str }
    method headse($/)  { make $/.Str }
    method pair($/)    { make $<key>.made => $<value>.made }
    method block($/)   { make $<pair>.map({ .made }).hash  }
    method section($/) { make $<header>.made => $<block>.made }
    method TOP($/) {
        make {
            _ => $<block>.made,
            $<section>.map: { .made },
        }
    }
}

sub parse-ini(Str $input) {
    my $m = IniFile.parse($input, :actions(IniFile::Actions));
    unless $m {
        die "the input is not a valid INI file";
    }
    return $m.made;
}

sub MAIN() {
    say parse-ini($example);
}

