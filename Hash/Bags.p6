use v6;
# my %words := KeyBag.new;
# for slurp.comb(/\w+/).map(*.lc) -> $word {
    # %words{$word}++;
# }
my %words := Bag.new(slurp.comb(/\w+/).map(*.lc));

say "%words{}";