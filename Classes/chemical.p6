class Chemical {
    has $.formula;
    method gist {
        my $output = $!formula;
        $output ~~ s:g/(<[0..9]>)/{(0x2080+$0).chr}/;
        $output;
    }
}

