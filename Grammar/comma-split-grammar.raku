#| https://stackoverflow.com/questions/75396967/split-a-string-by-commas-but-commas-in-a-token
use Grammar::Debugger;

grammar Test {
    regex TOP         { <actomic>+ % ',' }
    token actomic     {
        | <word>
        | <comma-in-token>
        | <color>
    }
    token word           { \w+                               }
    token sentence       { <word>+ % <[,\s]>+                }
    token comma-in-token { '"' ~ '"' <sentence>              }
    token digit          { \d+                               }
    token comma-in-digit { <digit>+ % ','                    }
    token color          { <word> '(' ~ ')' <comma-in-digit> }
}

my $input = 'something,"in a string, oooh",rgba(4,2,0)';

my $m = Test.parse($input).made;
dd $m;