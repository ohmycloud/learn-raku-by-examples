#!/usr/bin/env perl6

#| https://stackoverflow.com/questions/66411050/does-versus-but-operators-when-mixing-in-a-role-into-an-object-in-raku
#| does modifies an object in place (and should be used with caution with value types, see note below)
#| but returns a new object.

role R { method answer { 42 } }

my $question = 'question';
say $question.WHAT;   # (Str)

my $but  = $question but  R;
my $does = $question does R;

say $question.WHAT;   # (Str+{R})
say $but.WHAT;        # (Str+{R})
say $does.WHAT;       # (Str+{R})

say $question.WHERE;  # 129371492039210
say $but.WHERE;       # 913912490323923
say $does.WHERE;      # 129371492039210 <-- same as $question's

say $question.answer; # 42
say $but.answer;      # 42
say $does.answer;     # 42

say $question.^roles; # ((R) (Stringy))


#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
role Fooish { }

my @a;
@a.push('foo' does Fooish) for ^100;

say @a[0].WHAT; # (Str+{Fooish}+{Fooish}+{Fooish}+{Fooish}+{Fooish}+{Fooish}+{Fooish}+{Fooish}+{Fooish}+{Fooish}...)