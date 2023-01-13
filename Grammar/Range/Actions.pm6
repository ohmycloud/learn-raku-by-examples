unit class Range::Actions;

method TOP($/) {
     make $/.values».made;
}

method section($/) {
    make $/<line>».made;
}

method line($/) {
    make ~$/.trim;
}

method un-important-line($/) {
    make Empty;
}

method begin($/) {
    make Empty;
}

method end($/) {
    make Empty;
}