# A list comprehension is a special syntax in some programming languages to describe lists. It is similar to the way mathematicians describe sets, with a set comprehension, hence the name. 

# Some attributes of a list comprehension are that:
# 1. They should be distinct from (nested) for loops within the syntax of the language.
# 2. They should return either a list or an iterator (something that returns successive members of a collection, in order).
# 3. The syntax has parts corresponding to that of set-builder notation.

# Write a list comprehension that builds the list of all Pythagorean triples with elements between 1 and n. If the language has multiple ways for expressing such a construct (for example, direct list comprehensions and generators), write one example for each.

use v6;

my $n = 20;
my @list := gather for 1..$n -> $x {
         for $x..$n -> $y {
           for $y..$n -> $z {
             take $x,$y,$z if $x*$x + $y*$y == $z*$z;
           }
         }
       }
.say for  @list;

# Note that gather/take is the primitive in Perl 6 corresponding to generators or coroutines in other languages. It is not, however, tied to function call syntax in Perl 6. We can get away with that because lists are lazy, and the demand for more of the list is implicit; it does not need to be driven by function calls.
