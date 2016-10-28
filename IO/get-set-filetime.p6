use v6;

my $fn =  $?FILE;

my Instant $i = $fn.IO.accessed;
my $dt = $i.to-posix;

say :$dt.perl;
