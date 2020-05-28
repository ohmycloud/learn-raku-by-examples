#!/usr/bin/env perl6

my $str = q:to/EOS/;
Here's some unimportant text.
=begin code
This code block is what we're after.
We'll use 'ff' to get it.
=end code
More unimportant text.
=begin code
I want this line.
and this line as well.
HaHa.
=end code
More unimport text.
=begin code
Let's go home.
=end code
EOS

my token separator { '=begin code' \n | '=end code' \n }
my token lines { [<!separator> .]+ }

say $str.comb(
    /
        <lines>       # match lines that not start with
                      # =begin code or =end code
        <separator>   # match lines that start with
                      # =begin code or =end code
        <(            # start capture
            <lines>+  # match lines between
                      # =begin code and =end code
        )>            # end capture
        <separator>   # match lines that start with
                      # =begin code or =end code
    /).raku;