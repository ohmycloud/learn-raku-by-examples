.say for slurp("22.txt")\
         .words()\
         .classify( *.Str )\
         .map({; .key => .value.elems })\
         .sort( { -.value } )\
         .[ ^10 ];




