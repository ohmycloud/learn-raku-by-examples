use v6;

BEGIN {
    @*INC.push('/Volumes/WORK/1-Books/3-Perl6/examples/笔记/Grammars');
}
use Add1;

my @experssions = (
    "2 + 3",
    "2 + 4 ",
    "2 + 3 x",
    "2 +",
    "2 3",
    "2 - 3",
);

for @experssions -> $exp {
    print $exp, " ";
    my $result = Add1.parse($exp);
    say $result ?? 'OK' !! 'NOT OK'; 
    CATCH {
        say "exception received: $!";
    }
}
