use v6;

# create a file
my $f = open "foo",:w;
$f.print(time);
$f.close;

# copy
my $io = IO::Path.new("foo");
$io.copy("foo2");

# clean up
unlink ("foo2");

# move
$io.rename("foo2");

# clean up
unlink ("foo2");

