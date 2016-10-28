my %words := bag slurp.comb(/\w+/).map(*.lc);

for %words.pairs.sort(-*.value).map({ $_.key, $_.value }) -> $word, $count {
    say "$word: $count";
}