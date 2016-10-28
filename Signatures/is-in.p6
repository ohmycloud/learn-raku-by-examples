sub is-in(@array, $elem) {
  # this will `return` out of the `is-in` sub
  # once the condition evaluated to True, the loop won't be run anymore
  map({ return True if $_ ==  $elem }, @array);
}

my @array = 1,2,3,4,5;
is-in(@array,3);
