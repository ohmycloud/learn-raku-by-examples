sub  foo(@array [$fst, $snd]) {
  say "My first is $fst, my second is $snd ! All in all, I'm @array[].";
  # (^ remember the `[]` to interpolate the array)
}
my @tail = 1,2;
foo(@tail);

 #=> My first is 2, my second is 3 ! All in all, I'm 2 3
