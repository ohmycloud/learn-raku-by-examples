#!/usr/bin/env perl6

my $excerpt = q:to/END/;
Here's some unimportant text.
=begin code
This code block is what we're after.
We'll use 'ff' to get it.
=end code
More unimportant text.
=begin code
I want this line.
and this line as well.
HaHa
=end code
More unimport text.
=begin code
Let's to go home.
=end code
END

say ( $excerpt ~~ m:s:g{\=begin code\s+(.+?)\s+\=end code} ).map( *.[0] ).join("\n\n")

