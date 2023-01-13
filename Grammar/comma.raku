use v6;

my $string = q:to/THE END/;
Hangzhou Normal Univ, Coll Mat Chem & Chem Engn, Hangzhou 310036, Zhejiang, Peoples R China
Hong Kong Univ, Sci & Technol, Dept Chem, Kowloon, Hong Kong, Peoples R China
Hong Kong Univ, Sci & Technol, Inst Adv Study, Kowloon, Hong Kong, Peoples R China
THE END

grammar CommaSeparated::Grammar {
    token TOP   {^ <line>+ $      }
    token line  { <info> \n       }
    token info  { <field>+ % ', ' }
    token field { <-[,\n]>+       }
}

my $parsed = CommaSeparated::Grammar.parse($string);


# say $parsed<line>[0]<info><field>».Str;

for @($parsed<line>) -> $line {
    # say join ", ", $line<info><field>».Str;
    say  $line<info><field>».Str.[0];
}
