sub problems($x) { 
    return (1 .. 100).roll(10) 
    .map(* + 2) andthen
    .grep(* %% $x) 
} 

# A list of values that were divisible by 16
say problems(16) 