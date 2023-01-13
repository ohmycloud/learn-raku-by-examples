#| https://stackoverflow.com/questions/70351538/symbols-that-break-the-identifier-rules-e-g-sub
#| declare a method name that doesn't conform to identifiers
#| ::(...) is similar to ::<>() in Rust
class C { 
    method ::("A method name that's also a sentence!") { 
        say "this works"
    }
}

sub ::("☺") { 
    say "also works"
}

C."A method name that's also a sentence!"();  # OUTPUT: «this works»
&::("☺")();                                   # OUTPUT: «also works»