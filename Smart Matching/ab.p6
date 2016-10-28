    constant A = 100;
    constant B = 100;
 
    my (%powers, %count);
 
    # find bases which are powers of a preceeding root base
    # store decomposition into base and exponent relative to root
    for 2..Int(sqrt A) -> \a {
        next if a ~~ %powers;
        %powers{a, a**2, a**3 ...^ * > A} = a X=> 1..*;
    }
 
    # count duplicates
    for %powers.values -> \p {
        for 2..B -> \e {
            # raise to power \e
            # classify by root and relative exponent
            ++%count{p.key => p.value * e}
        }
    }
 
    # add +%count as one of the duplicates needs to be kept
    say (A - 1) * (B - 1) + %count - [+] %count.values;