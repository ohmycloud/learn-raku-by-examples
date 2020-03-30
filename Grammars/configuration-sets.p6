#!/usr/bin/env perl6
use lib '.';
use ConfigurationSets;
use ConfigurationSetsActions;

my $actions = ConfigurationSetsActions;
my $sets = ConfigurationSets.parse(q:to/EOI/, :$actions).made;
second=b # Just a thing
hits=42
perl=6

third=c # New one
hits=33
EOI

for @$sets -> $set {
    say "Element→ $set";
}