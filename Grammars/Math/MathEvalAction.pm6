unit class MathEvalAction;

method TOP($/) {
    make $<sum>.made;
}

method sum($/) {
    make [+] $<product>».made;
}

method product($/) {
    make [*] $<term>».made;
}

method term($/) {
    make $/.values[0].made;
}

method group($/) {
    make $<sum>.made;
}

method number($/) {
    make $/.Int;
}