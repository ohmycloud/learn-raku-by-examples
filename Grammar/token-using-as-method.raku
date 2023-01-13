#| https://www.reddit.com/r/rakulang/comments/sys61e/most_nonalpha_characters_in_a_row/
#| note that $¢ is not the same as $c
my token filter ($want) {
    .                # match a single character
    <?{              # check if 
        $¢.Str       #     that-matched-char-as-string
        ∈            #     is an element of
        $want        #     what we want
    }>
}

my Match $m = 'Rakoons Love Raku' ~~ /<&filter(['a', 'e', 'i', 'o', 'u'])>/;
say ~$m;

#| a token with emoji ☹ as name 
#| https://stackoverflow.com/questions/70351538/symbols-that-break-the-identifier-rules-e-g-sub
my token ::('☹'){
    .
    <?{ dd ::('%_'); # {"»" => ("z", "e", "b")}
        ~$¢
        ∈
        ::('%_')<»>
    }>
}

note 'abc' ~~ /<&::('☹')( |('»' => <z e b>) )>/; # OUTPUT: «｢b｣»

note 'abc'~~/<&::('☹')(|('»' => [122,101,98].».chr))>/;
