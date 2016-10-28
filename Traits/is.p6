multi sub trait_mod:<is>(Routine $r, :$doubles!) {
    $r.wrap({
        2 * callsame;
    });
}

sub square($x) is doubles {
    $x * $x;
}

say square 3; 
