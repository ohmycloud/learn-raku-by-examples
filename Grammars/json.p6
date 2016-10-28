# file lib/JSON/Tiny/Grammar.pm

 grammar JSON::Tiny::Grammar {
     rule TOP      { ^[ <object> | <array> ]$ }
     rule object   { '{' ~ '}' <pairlist>     }
     rule pairlist { <pair>* % [ \, ]         }
     rule pair     { <string> ':' <value>     }
     rule array    { '[' ~ ']' [ <value>* % [ \, ] ] }

 proto token value { <...> };

 token value:sym<number> {
     '-'?
     [ 0 | <[1..9]> <[0..9]>* ]
     [ \. <[0..9]>+ ]?
     [ <[eE]> [\+|\-]? <[0..9]>+ ]?
 }

 token value:sym<true>   { <sym>    };
 token value:sym<false>  { <sym>    };
 token value:sym<null>   { <sym>    };
 token value:sym<object> { <object> };
 token value:sym<array>  { <array>  };
 token value:sym<string> { <string> }

 token string {
     \" ~ \" [ <str> | \\ <str_escape> ]*
 }

 token str {
     [
         <!before \t>
         <!before \n>
         <!before \\>
         <!before \">
         .
     ]+
     # <-["\\\t\n]>+
 }

 token str_escape {
     <["\\/bfnrt]> | u <xdigit>**4
 }

 }


 # test it:
 my $tester = '{
     "country": "Austria",
     "cities": [ "Wien", "Salzburg", "Innsbruck" ],
     "population": 8353243
 }';

 if JSON::Tiny::Grammar.parse($tester) {
     say "It's valid JSON";
 } else {
     # TODO: error reporting
     say "Not quite...";
 }