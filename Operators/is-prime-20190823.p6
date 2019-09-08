# '20190823'.substr(*-$_).say for ((1..'20190823'.chars).Set (-) '20190823'.chars «-» '20190823'.indices(0)).keys.sort(-*);


given '20190823' {
    for ((1 .. .chars) ∖ .chars «-» .indices(0)).keys.sort(-*) -> $n {
        say "{.substr(* - $n)} is prime" if .substr(* - $n).is-prime;
    }
}