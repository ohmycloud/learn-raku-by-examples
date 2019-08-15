use v6;

my $file=open "test.txt", :r;

my %dict;
my $line;

repeat {
    $line=$file.get;
    my ($p1,$p2)=$line.split(' ');
    if ?%dict{$p1} {
        %dict{$p1} = "{%dict{$p1}} {$p2}".words;
    } else {
        %dict{$p1} = $p2;
    }
} while !$file.eof;

## Test
say "The pairs count of the key word \"was\" in wordpairs.txt is {%dict{"was"}.elems}";