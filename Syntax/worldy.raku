#| https://gfldex.wordpress.com/2022/01/24/iterative-golfing/
multi sub infix:<⊙>(&c, +@a) {
    &c.assuming(|@a)
}
sub sc($_) {
    .words».&{ ((&lc, &uc) «⊙« .comb)».().join }
}

say sc "sarcasmcase FOR YOU";