my $excerpt = q:to/END/;
Here's some unimportant text.
=begin code
    This code block is what we're after.
    We'll use 'ff' to get it.
=end code
More unimportant text.
=begin code
    Today rains heavy.
    Long live AI .
    HaHa
=end code
More unimport text.
=begin code
    Like to go home.
=end code
END

my @codelines = gather for $excerpt.lines {
    take $_ if "=begin code" ff "=end code"
}

# this will print four lines, starting with "=begin code" and ending with
# "=end code"
#say @codelines.join("\n");

my @lines = gather {
  my @current;

  for $excerpt.lines {

    if "=begin code" ^ff^ "=end code" {

      # collect the values between matches
      push @current, .trim;

    } else {
      # take the next value between matches

      # don't bother if there wasn't any values matched
      if @current {

        # you must do something so that you aren't
        # returning the same instance of the array
        take @current.List;
        @current = ();
      }
    }
  }
}

.Str.say for @lines;
