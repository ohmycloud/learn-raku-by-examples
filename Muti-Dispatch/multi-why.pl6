#!/usr/bin/env perl6

#|(Some enlightening words about myfunc.)
sub my-single-func (Int $i) { say "You provided an integer: $i"; };
#=(Some more words about myfunc.)

say "my-single-func is a {&my-single-func.perl}";
say "This {&my-single-func.^name} does {&my-single-func.WHY}";


#|(my-multi-func accepts either an integer or a string)
proto my-multi-func (|) {*}

#|(myfunc accepts an integer.)
multi my-multi-func (Int $i) { say "You provided an integer $i"; };

#|(myfunc accepts a string.)
multi my-multi-func (Str $s) { say "You provided a string $s"; };

#`[
And this is how a multi would work.
You can still access every documentation. Somehos
]

say "my-multi-func is a {&my-multi-func.perl} and does {&my-multi-func.WHY}";
