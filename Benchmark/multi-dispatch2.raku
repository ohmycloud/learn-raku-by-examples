my @monsters = < godzilla  mothera     ghidora  gammera  golem wormface >;
my @heroes   = < beowulf   bluebeetle  bernie   mothera  godzilla maynard_g_krebs >;

subset Monster of Str where * eq @monsters.any ;
subset Hero    of Str where * eq @heroes.any ;

## Monster is favored over Hero because of the order of definition of these multi subs
multi sub speak (Monster $m) {
    say "The monster, $m roars!";
}

multi sub speak (Hero $h) {
    say "The hero, $h shouts!";
}

speak('ghidora');  # The monster, ghidora roars!
speak('beowulf');  # The hero, beowulf shouts!
speak('mothera');  # The monster, mothera roars!
