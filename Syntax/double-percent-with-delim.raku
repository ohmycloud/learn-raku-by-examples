my grammar Gram {
    regex TOP { ('XX')+ %% $<delim>=<.same> }
}

my $m = Gram.parse('XXXXXX');
say $m;
