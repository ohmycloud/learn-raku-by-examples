my @a = ("apple", " banana", " peach", "blueberry", "pear", " plum", "kiwi");

#| &c decides if the group is finished
sub group-list(@a, &c) {
   my @group;
   gather while @a {
       my $e = @a.shift;
       my $next := +@a ?? @a.head !! Nil;
       @group.push($e);
       if !c($e, $next) {
           take @group.clone;
           @group = ();
       }
   }
}

dd @a.&group-list(-> $left, $right { $right && $right.starts-with(' ')});