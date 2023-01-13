grammar InnerLang {
    rule TOP { \s+ | ['(' ~ ')' .* ] }
}
grammar MainLang  {
    rule TOP       { [<.text-like> <lisp-like>*]* }
    rule text-like { [ <.alpha>+ ]+}

    rule lisp-like {
        :my $inner;
        <?{ $inner
              = InnerLang.subparse: $/.orig, :pos($/.to) }>
        .**{$inner.to - $/.pos}
    #   ^^^^^^^^^^^^^^^^^^^^^^^ I really dislike this part
    }
}