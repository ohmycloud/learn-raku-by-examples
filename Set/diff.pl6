use v6;

my @logname = lines "qr.txt".IO;
my @mysql = lines "ifo.txt".IO;

my $diff = @logname.unique (&) @mysql.unique;

.say for $diff.keys.sort;
