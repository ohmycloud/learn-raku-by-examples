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

for $excerpt.comb(/^^ '=begin code' $$ \s* <( .+? )> \s+ ^^ '=end code' $$/) -> $c {
    say $c;
    say '-' x 15;
}

my $str = slurp "/Users/ohmycloud/scripts/Perl6/learn-perl6-by-examples/Operators/flip_flop.txt";
say $str;