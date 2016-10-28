my %words := KeyBag.new;
for slurp.comb(/\w+/).map(*.lc) -> $word {
    %words{$word}++;
}

for %words.pairs.sort(-*.value).map({ $_.key, $_.value }) -> $word, $count {
    say "$word: $count";
}