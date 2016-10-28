# Loop over multiple arrays (or lists or tuples or whatever they're called in your language) and print the ith element of each. Use your language's "for each" loop if it has one, otherwise iterate through the collection in order with some other loop. 

# For this example, loop over the arrays (a,b,c), (A,B,C) and (1,2,3) to produce the output 
# aA1
# bB2
# cC3

for <a b c> Z <A B C> Z 1, 2, 3 -> $x, $y, $z {
   say $x, $y, $z;
}

# The Z operator stops emitting items as soon as the shortest input list is exhausted. However, short lists are easily extended by replicating all or part of the list, or by appending any kind of lazy list generator to supply default values as necessary. 

# Note that we can also factor out the concatenation by making the Z metaoperator apply the ~ concatenation operator across each triple: 
for <a b c> Z~ <A B C> Z~ 1, 2, 3 -> $line {
   say $line;
}

# We could also use the zip-to-string with the reduction metaoperator: 
.say for [Z~] [<a b c>], [<A B C>], [1,2,3]
