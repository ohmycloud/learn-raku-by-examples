use v6;
use List::Utils;

my @array = <1 3 4 6 7>;
my @b = sliding-window(@array,2);
.say for @b;
say '-' x 15;
my @c = combinations(@array);
.say for @c;
say '-' x 15;

my @d = combinations(@array,3);
.say for @d;

say '-' x 15;
my @e = combinations(@array,4);
.say for @e;

say '-' x 15;
my @take = take-while((1...*), * <= 10); 
.say for @take;

say '-' x 15;
my @takerange = take-while((1...*), * + 4 < 10);
.say for @takerange;

say '-' x 15;
my @aa = uniq-by(<A B C a b c d D e>, *.uc);
my @bb = uniq-by((1..* Z -2..*), *.abs)[^10];
my @cc = uniq-by((1..* Z -2..*), *+1)[^10];
.say for @aa;
say '-' x 15;
.say for @bb;
say '-' x 15;
.say for @cc;