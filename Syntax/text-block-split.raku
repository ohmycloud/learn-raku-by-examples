my $excerpt = q:to/END/;
Here's some unimportant text.
=begin code
This code block is what we're after.
We'll use 'ff' to get it.
=end code
=end code
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
=end code
=end code
END

my @codelines = gather for $excerpt.lines {
    take $_ if /"=begin code"|"=end code"/ fff /"=end code"|"=begin code"/
}

# this will print four lines, starting with "=begin code" and ending with
# "=end code"

.say for @codelines;