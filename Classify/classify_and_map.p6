.say for slurp("README.txt")\           # whole file into string
         .words()\                      # split into list of words
         .classify( *.Str )\            # group words with multiplicity
         .map({;.key => .value.elems })\
                                        # turn lists into lengths
         .sort( { -.value } )\          # sort descending
         .[ ^10 ];                      # 10 most common words

# Output:
# the => 40
# to => 21
# is => 16
# a => 16
# that => 11
# be => 11
# stack => 10
# implementation => 8
# link => 8
# it => 7
