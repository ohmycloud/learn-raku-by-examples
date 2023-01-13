my $match = Match.new: :orig('The language Raku is -Ofun');
my $res = $match.&(/:s[\w+ ]**2<($<name>=[\w+] is (.*)/);
say $res;       # OUTPUT: «｢The language Raku is -Ofun｣»
# No capture groups, etc   ^^^^^^^^^^^^^^^^^^^^^^^^^^^

#    vvvvv the `MATCH` method `is implementation-detail`
$res.MATCH;
#    ^^^^^ $res is modified in place
say $res;       # OUTPUT: «｢Raku is -Ofun｣
                #           name => ｢Raku｣
                #           0 => ｢-Ofun｣»