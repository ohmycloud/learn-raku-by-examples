use v6.e.PREVIEW;

# Add method Any.snitch in 6.e
# This allows one to easily inspect a stage of a method call chain
# on STDERR
(^10).grep(* %% 2).snitch.map(* ** 2).say;

# Also include a sub version of snitch, mainly intended to be used with the feed operator:
(1..10) ==> snitch() ==> say();
(1..10) ==> snitch(&dd) ==> say();

say '-' x 25;

# return a list without the nth element
say (^20).skip(5, 1);

say (^20).skip(5,3,3,6);     # (0 1 2 3 4 8 9 10 17 18 19)
say (^20).skip(0,5,3);       # (5 6 7)
say (^20).skip(|(2,3) xx *); # (0 1 5 6 10 11 15 16)

say '-' x 25;

# Introduce // as a definedness prefix operator in 6.e
my $finished;
my $years = Date.today.year - 2019;
say [//] $finished, $years;
say //6;
say //'String';
say //Empty;
say //Nil;

say '-' x 25;

say 'abcde'.comb(3 => -2);
say 'abcde'.comb(3 => -2, :partial);

say '-' x 25;
say nano;