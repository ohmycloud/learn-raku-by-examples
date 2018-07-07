use v6;
sub MAIN(Str $file1, $file2) {
    my @logname = lines "$file1".IO;
    my @mysql = lines "$file2".IO;
    my $diff = @logname.unique (&) @mysql.unique;
    .say for $diff.keys.sort;
}
