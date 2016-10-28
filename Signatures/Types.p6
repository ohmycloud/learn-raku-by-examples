use v6;

# In Perl 6, every value knows its type.

say 42.WHAT;
say "camel".WHAT;
say [1, 2, 3].WHAT;
say (sub ($n) { $n * 2 }).WHAT;

# (Int)   
# (Str)   
# (Array) 
# (Sub)   

# A type name in Perl 6 represents all possible values of that type.