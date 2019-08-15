use v6;
my @rray=17,21,34,47,58,69;

say 'the array has element' if  ? @rray;   # boolean context, Bool::True if array has any value in it, even if its a 0
say 'the array has ',+ @rray ~' element';  # numeric context, number of elements (like in Perl 5 scalar @a)
say ~ @rray;              # string context, you get content of all cells, stringified and joined, same as "@primes[]"

say @rray.elems;          # same as + @rray
say @rray.end;            # number of the last element, equal to @rray.elems-1, # 5
# say @rray.cat;          # same ~ @rray
say @rray.join('-');      # also same result, you can put another string as parameter that gets between all values
say @rray.unshift(7);     # prepend one value to the array, # 7 1 2 3 4 5 6
say @rray.shift;          # remove the first value and return it # 7
say @rray.push(8);        # add one value on the end # 1 2 3 4 5 6 8
say @rray.pop;            # remove one value from the end and return it # 8

my $n=2;
my $pos=1;
my @ind=0..3;
say @rray.splice($pos,$n);# remove on $pos $n values and replace them with values that follow that two parameter
say @rray:delete(@ind);   # delete all cell with indecies of @ind # 1 4 5 6
say @rray:exists(@ind);   # Bool::True if all indecies of @ind have a value (can be 0 or '')

say '-' x 18;
say @rray;
say @rray.pick([$n]);     # return $n (default is 1) randomly selected values, without duplication
say @rray.roll([$n]);     # return $n (default is 1) randomly selected values, duplication possible (就像掷筛子)
say @rray.reverse;        # all elements in reversed order
say @rray.rotate(-$n);    # returns a list where $n times first item is taken to last position if $n is positive, if negative the other way around
# @rray.sort($coderef); # returns a sorted list by a userdefined criteria, default is alphanumerical sorting
say @rray.min;            # numerical smallest value of that array
say @rray.max;            # numerical largest value of that array
my ($a,$b)= @rray.minmax;  # both at once, like in .sort . min or .max a sorting algorith can be provided
say $a,"   $b";
# @rray.map($coderef);  # high oder map function, runs $coderef with every value as $_ and returns the list or results
# @rray.classify($cr);  # kind of map, but creates a hash, where keys are the results of $cr and values are from @rray
# @rray.categorize($cr);# kind of classify, but closure can have no (Nil) or several results, so a key can have a list of values
say @rray.grep({$_>40});   # high order grep, returns only these elements that pass a condition ($cr returns something positive)
# @rray.first($coder);  # kind of grep, return just the first matching value
# say @rray.zip;            # join arrays by picking first element left successively from here and then there
