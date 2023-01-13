#duckmap will apply &block on each element that behaves in such a way that &block can be applied. 
#If it fails, it will descend recursively if possible, or otherwise return the item without any transformation.
# It will act on values if the object is Associative.

<a b c d e f g>.duckmap(-> $_ where <c d e>.any { .uc }).say;
# OUTPUT: «(a b C D E f g)␤» 
(('d', 'e'), 'f').duckmap(-> $_ where <e f>.any { .uc }).say;
# OUTPUT: «((d E) F)␤» 
{ first => ('d', 'e'), second => 'f'}.duckmap(-> $_ where <e f>.any { .uc }).say;
# OUTPUT: «{first => (d E), second => F}␤» 

#In the first case, it is applied to c, d and e which are the ones that meet the conditions for the block ({ .uc }) to be applied; 
# the rest are returned as is.

#In the second case, the first item is a list that does not meet the condition, so it's visited; 
# that flat list will behave in the same way as the first one. In this case:

say [[1,2,3],[[4,5],6,7]].duckmap( *² ); # OUTPUT: «[9 9]␤»

#You can square anything as long as it behaves like a number. In this case, there are two arrays with 3 elements each; 
# these arrays will be converted into the number 3 and squared. In the next case, however

say [[1,2,3],[[4,5],6.1,7.2]].duckmap( -> Rat $_ { $_²} );
# OUTPUT: «[[1 2 3] [[4 5] 37.21 51.84]]␤»

#3-item lists are not Rat, so it descends recursively, but eventually only applies the operation to those that walk (or slither, as the case may be) 
# like a Rat.

#Although on the surface (and name), duckmap might look similar to deepmap, the latter is applied recursively regardless of the type of the item.