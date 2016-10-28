# Works with: Rakudo Star version 2010.08
loop {
    say 'SPAM';
}

# In addition, there are various ways of writing lazy, infinite lists in Perl 6: 
print "SPAM\n" xx *;      # repetition operator
print "SPAM\n", ~* ... *; # sequence operator
map {say "SPAM"}, ^Inf;   # upto operator
