given open("output-perl6", :w) { 
    my $catFace = "\x1F639";    .say($catFace);    .say($catFace.chars);    my $dWithDots = "D\x0323\x0307";    .say($dWithDots);    .say($dWithDots.chars);    .close; 
}