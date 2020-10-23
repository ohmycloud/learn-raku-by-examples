proto pick-winner(|) {*}
 
multi pick-winner (Int \s) {
    my &nextone = nextcallee;
    Promise.in(π²).then: { nextone s }
}
multi pick-winner { say "Woot! $^w won" }
 
with pick-winner ^5 .pick -> \result {
    say "And the winner is...";
    await result;
}
 
# OUTPUT: 
# And the winner is... 
# Woot! 3 won 
