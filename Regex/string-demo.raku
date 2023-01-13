#| https://stackoverflow.com/questions/72649593/how-does-one-manipulate-the-characters-of-a-raku-string-based-on-case
sub MAIN() {
    my token left-delimiter   {  <[ ' < ]>   }
    my token right-delimiter  {  <[ ' > ]>   }
    my token middle-character { <(<-[ ' < > ]>+)> }
    my token quotation-string { <left-delimiter> ~ <right-delimiter> <middle-character> }
    my token target-string    { <quotation-string>+ % \s+ }

    sub extract-characters-between-delimiter(Str $s) {
        if $s ~~ / <target-string> / {
            say [~] gather for $/<target-string>{'quotation-string'} {
                        take .{'middle-character'}
                    }
        }
    }

    my @target-strings = [ 
        Q｢｢'a' <S> 'b' <T> 'c'｣｣,
        Q｢｢<A> ' ' <B> 'x' 'y' <C> '$' <B>"｣｣,
        Q｢｢<X> <Y> '1' '2'｣｣
    ];

    extract-characters-between-delimiter($_) for @target-strings;
}