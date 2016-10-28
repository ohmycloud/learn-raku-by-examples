lazy gather {
     CANDIDATE: for  2 .. 110 -> $candidate {
         for  2 .. sqrt $candidate  -> $divisor {
            next CANDIDATE if $candidate % $divisor == 0;
         }
        take $candidate;
     }
 } ==> my @vals;

say @vals[10];
say now - INIT now;