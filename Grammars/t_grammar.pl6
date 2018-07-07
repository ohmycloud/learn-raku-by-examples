use Grammar::Tracer;
grammar S {
    token TOP { ^ <section>+ $}
    token section { <line> \s* [<!line>.]+}
    token line {\d+ '、' .+ }
}

my $a = S.parsefile("ff.pl").made;
say $a.perl;