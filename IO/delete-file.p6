use v6;

# create a file
my $f = open "foo",:w;
$f.print(time);
$f.close;

unlink "foo";
