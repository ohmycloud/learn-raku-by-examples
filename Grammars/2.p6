use v6;
use Grammar::Debugger;

my $string = "[Wang, Zhiguo; Zhao, Zhiguo] Hangzhou Normal Univ, Ctr Cognit & Brain Disorders, Hangzhou, Zhejiang, Peoples R China; [Wang, Zhiguo; Theeuwes, Jan] Vrije Univ Amsterdam, Dept Cognit Psychol, Amsterdam, Netherlands";

grammar University::Grammar {
    token TOP             { ^ <university> $             }
    token university      { [ <bracket> <info> ]+ % '; ' }
    token bracket         { '[' <studentname>  '] '      }
    token studentname     { <stdname=.info>+ % '; '      }
    token info            { <field>+ % ', '              }
    token field           { <-[,\]\[;\n]>+               }
}

grammar MyUniversity  is University::Grammar {
    token university      { <info>+ % '; ' }
}

my $sr = "Zhejiang Univ, Coll Environm & Resources Sci, Dept Resource Sci, Hangzhou 310029, Peoples R China; La Trobe Univ, Dept Agr Sci, Bundoora, Vic 3083, Australia; Hangzhou Normal Coll, Fac Life Sci, Hangzhou, Peoples R China";

my $parsed = University::Grammar.parse($string);
# my $parsed = MyUniversity.parse($sr);

for @($parsed<university><info>) -> $f {
    say $f<field>[0];
}
