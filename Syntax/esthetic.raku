sub MAIN(:$number) {
    my Seq $pairs := $number.comb.rotor(2 => -1);

    # for $pairs {
    #     say $_.WHAT; # List
    #     say test($_);
    # };

    $pairs».&test.say; # Type check failed in binding to parameter '$l'; expected List but got Str ("5")
    
}

sub test(List $l) {
    return $l[0].Int - $l[1].Int;
}