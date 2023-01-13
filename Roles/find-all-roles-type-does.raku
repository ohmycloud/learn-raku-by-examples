#!/usr/bin/env perl6

#| https://stackoverflow.com/questions/50402115/how-can-i-discover-all-the-roles-a-perl-6-type-does
say Rat.^roles; # ((Rational[Int,Int]) (Real) (Numeric))
say Rat.^roles(:!transitive); # ((Rational[Int,Int]))