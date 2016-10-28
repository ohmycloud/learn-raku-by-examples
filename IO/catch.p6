my $total = 0;
for @files -> $filename {
    $total += lines($filename.IO).grep(
        { $_ !~~ /<&insigline>/ }
).elems;
 CATCH {
        when X::IO {
            note "Couldn't read $filename";
} }
}
say $total;
# As CATCH goes inside of the scope,we can see the scope's lexicals!
￼
