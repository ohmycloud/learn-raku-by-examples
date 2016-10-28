use v6;

my %dev =  'pugs'=>'audreyt', 'pct'=>'pm', "STD"=>'larry';
my %same_dev = :rakudo('jnthn'), :testsuite('moritz');            # adverb (pair) syntax works as well
my %too_dev = ('audreyt', 'pugs', 'pm', 'pct', 'larry', "STD");  # lists get autoconverted in hash context
my %compiler = Parrot => {Rakudo => 'jnthn'}, SMOP => {Mildew => 'ruoso'};       # hash of hashes (HoH)
say %dev.perl;
say %same_dev.perl;
say %too_dev.perl;
say %compiler.perl;

# Hash Slices
my $name='pugs';
my $value = %dev{'pugs'};      # just give me the value related to that key, like in P5
my $value1 = %dev<STD>;         # <> autoquotes like qw() in P5
my $value2 = %dev<<$name>>;     # same thing, just with eval
say $value;
say $value2;

my @values = %dev{'pugs', 'STD'};
my @values2 = %dev<pugs STD>;
my @values3 = %dev<<pugs STD $name>>;
say @values;
say @values2;
say @values3;

say %compiler<Parrot><Rakudo>; # value in a HoH, returns 'jnthn'
say %compiler<SMOP>;           # returns the Pair: Mildew => 'ruoso'

# %dev   {'audrey'};         # error, spaces between varname and braces (postcircumfix operator) are no longer allowed
say %dev\  {'pugs'};        # works, quote the space
# %dev   .<dukeleto>;        # error
say %dev\ .{'pugs'};        # works too, "long dot style", because its its an object in truth 
say %dev.{'pugs'};


# Hash Methods
say 'this hash has some pairs' if ? %dev;                    # bool context, true if hash has any pairs
say 'this hash has '~ + %dev ~' pairs';                      # numeric context, returns number of pairs(keys)
say ~ %dev;                    # string context, nicely formatted 2 column table using \t and \n

my $table = %dev;             # same as ~ %dev
say $table;                   # ("pugs" => "audreyt", "pct" => "pm", "STD" => "larry").hash
say %dev.say;                 # stringified, but only $key and $value are separated by \t  #("pugs" => "audreyt", "pct" => "pm", "STD" => "larry").hash
my  @pairs = %dev;             # list of all containing pairs
say @pairs;                    # "pugs" => "audreyt" "pct" => "pm" "STD" => "larry"
say %dev.pairs;                 # same thing in all context  # "pugs" => "audreyt" "pct" => "pm" "STD" => "larry"
say %dev.elems;                 # same as + %dev or + %dev.pairs  # 3
say %dev.keys;                  # returns the list with all keys
say %dev.values;                # list of all values
say %dev.kv;                    # flat list with key1, value1, key 2 ...
say %dev.invert;                # reverse all key => value relations
say %dev.push(@pairs);         # inserts a list of pairs, if a key is already present in %dev, both values gets added to an array
# ("pugs" => ["audreyt", "audreyt"], "pct" => ["pm", "pm"], "STD" => ["larry", "larry"]).hash

my @another_pairs='Rakudo'=>'Perl6';
say %same_dev.push(@another_pairs);