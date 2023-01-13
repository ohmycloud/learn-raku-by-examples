sub MAIN(:$p) {
    my @lines = "charge.txt".IO.lines;
    
    my @words = |gather for @lines -> $l {
        take $l.comb(/\w+/).Slip
    }
    
    @words.grep(/^$p/).sort.unique.say;
}