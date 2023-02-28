sub MAIN() {
    explicit-whitespace-in-token();
}

sub implicit-whitespace-in-rule() {
    my rule expression { 4 '+' 5 };
    
    say so " 4+5 "      ~~ /<expression>/;
    say so "4+5 "       ~~ /<expression>/;
    say so "4+5"        ~~ /<expression>/;
    say so "4 + 5"      ~~ /<expression>/;
    say so "4  +     5" ~~ /<expression>/;
    say so "4 #`() + 5" ~~ /<expression>/; 
}

sub explicit-whitespace-in-token() {
    my token expression { 4 <.ws> '+' <.ws> 5 };
    
    say so " 4+5 "      ~~ /<expression>/;
    say so "4+5 "       ~~ /<expression>/;
    say so "4+5"        ~~ /<expression>/;
    say so "4 + 5"      ~~ /<expression>/;
    say so "4  +     5" ~~ /<expression>/;
    say so "4 #`() + 5" ~~ /<expression>/; 
}