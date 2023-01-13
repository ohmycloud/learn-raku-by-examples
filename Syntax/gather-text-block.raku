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

my @codelines = gather {
  my @current;

  for $excerpt.lines {

    if "=begin code" ^ff^ "=end code" {

      # collect the values between matches
      push @current, $_;

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

say @codelines.raku;