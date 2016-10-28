use v6;
sub MAIN($file1, $file2) {
    my $words1 = bag slurp($file1).comb(/\w+/).map(*.lc);
    my $words2 = set slurp($file2).comb(/\w+/).map(*.lc);
    my $unique = ($words1 (-) $words2);
    for $unique.list.sort({ -$words1{$_} })[^10] -> $word {
        say "$word: { $words1{$word} }";
    }
}