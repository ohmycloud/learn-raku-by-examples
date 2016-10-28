my @bad_ext = ('plx', 'pm', 'pl', 'p6');
my $file_ext = 'p6';
if lc($file_ext) eq any(@bad_ext) {
    say "$file_ext files is  allowed, You are a Perler";
}

