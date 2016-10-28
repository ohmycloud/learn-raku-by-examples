#.say for slurp("README.txt")\           # whole file into string
#         .words()\                      # split into list of words
#         .classify( *.Str );

my @a = slurp("README.txt").words;
# .say  for @a.classify( *.Str );
# output:
#  可见输出的是一个散列
# that => that that that that that that that that that that that
# the => the the the the the the the the the the the the the the ...
# is => is is is is is is is is is is is is is is is is

my %hash = @a.classify( *.Str );
for %hash.sort({-.value.elems}).hash.kv.[^20] -> $key, $value {
    say $key ,"\t", $value.elems;

}
