use v6;

# Sometimes, you need to do some more powerful validation on arguments.

sub discount($price, $percent 
             where (1 <= $percent <= 100)) {
    say "You get $percent% off! Pay EUR " ~ $price - ($price * $percent / 100);
}
discount(100, 20);
discount(100, 200);