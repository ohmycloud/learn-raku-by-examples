use lib '.';
use Section::Grammar;
use Section::Actions;

my $parsed = Section::Grammar.parsefile(
        @*ARGS[0] // 'data/section.txt',
        :actions(Section::Actions)
        ).made;

.Str.say for @$parsed;