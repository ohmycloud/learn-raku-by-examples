use v6;
my %words;
for slurp.comb(/\w+/).map(*.lc) -> $word {
    %words{$word}++;
}
say %words.kv;
