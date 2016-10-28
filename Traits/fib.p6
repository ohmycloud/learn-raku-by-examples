sub fib(Int $nth where * >= 0) {
  given $nth {
    when 0 { 0 }
    when 1 { 1 }
    default { fib($nth-1) + fib($nth-2) }
 } 
}
say fib(3);
#say fib(-3);

subset FirstName
    of Str
  where 0 < *.chars && *.chars < 256;

sub first_name(FirstName $name){
    say "$name";
}

first_name("Wall"); 

subset PointLimit of Int where -10 <= * <= 10;
sub test(PointLimit $number) {
    say $number;
}
test(-5);

subset SmallInt of Int where -10 .. 10;
sub small(SmallInt $number) {
    say $number;
}

small(8);
