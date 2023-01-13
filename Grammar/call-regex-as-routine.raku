my rule word { <alpha>+ }
say &word.WHAT;            # OUTPUT: «(Regex)»
#   ^ & sigil required b/c it does Callable
try word('a');
#        ^^^ Regexes don't take Str arguments
say $!.^name;              # OUTPUT: «(X::Method::NotFound)»

my $match = Match.new: :orig('Raku is -Ofun');
# call with ^^^^^^ a Match:D with the Str in :orig
say word($match);          # OUTPUT: «｢Raku｣»

# We can build a non-zero match using :to and :from
my $m2 = Match.new: :orig('Raku is -Ofun'), :from(0) :to(8);
say $m2;                   # OUTPUT: «｢Raku is ｣»
# And we can use that Match normally:
say $m2.&(/'-' \w**4/);    # OUTPUT: «｢-Ofun｣»
#         ^^^^^^^^^^^ regex-literal syntax also works

# A Regex is a Method and a Routine
say &word.^mro[1..4];      # OUTPUT: «((Method) (Routine) (Block) (Code))»
say $match.&word;          # OUTPUT: «｢Raku｣»
# so using ^^^^^^ method syntax might be more fitting

# A regex also returns a Match:
my $res = word $match;
say $res.WHAT;             # OUTPUT: «(Match)

# But *not* the same Match it got:
say $match.WHICH;          # OUTPUT: «Match|94080907590240»
say $res.WHICH;            # OUTPUT: «Match|94080907590384»
say $match, $res;          # OUTPUT: «(｢｣ ｢Raku｣)»
#   ^^^^^^ the Match we started with is unchanged

# The returned Match records where we are in the input string:
say $res.raku; #`[ OUTPUT: «Match.new( :orig("Raku is -Ofun"),
                                       :from(0), :pos(5) )» ]
# Which lets us use it as input for a new match:
say my $r2 = $res.&word; # OUTPUT: «｢is ｣»
say $r2.raku;  #`[ OUTPUT: «Match.new( :orig("Raku is -Ofun"),
                                       :from(5), :pos(8) )» ]