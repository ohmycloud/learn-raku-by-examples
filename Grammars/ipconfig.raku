use lib '.';
use IPConfig::Grammar;
use IPConfig::Action;

my $ipconfig = IPConfig::Grammar.parsefile(
    "data/ifconfig.txt",
    :actions(IPConfig::Action)
).made;

.Str.say for @$ipconfig;