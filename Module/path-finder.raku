use Path::Finder;

my $finder = Path::Finder.file.skip-vcs.ext(/raku/).size(* < 10_1000);

for $finder.in('.') -> $file {
    say $file;
}
