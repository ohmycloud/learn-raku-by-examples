unit class Section::Actions;

method TOP($/) {
     make $/.values».made;
}

method section($/) {
    make ~$/.trim;
}

method line($/) {
    make ~$/.trim;
}

method separator($/) {
    make Empty;
}