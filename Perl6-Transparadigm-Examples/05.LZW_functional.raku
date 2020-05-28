#! /usr/bin/env perl6
use v6;

# To compress a string...
sub compress(Str $uncompressed) {
    # Encode the character list via a dictionary, from the start
    encode( $uncompressed.comb, code => hash(map {$^ASCII.chr => $^ASCII}, ^256), seen => "" )
}

# Encode an empty list where nothing already seen as nothing
multi encode([], :%code, :$seen where "") {}

# Encode an empty list where something already seen by look-up
multi encode([], :%code, :$seen)          { %code{$seen} }

# Encode an list of one or more uncompressed characters...
multi encode([$next, *@uncompressed], :%code, :$seen)  {
    # If [already-seen plus next char] is a known sequence...
    %code{ $seen~$next }:exists
         # Then encode all of that together
        ?? encode(@uncompressed, :%code, seen => $seen~$next)

         # Else emit encoding for the already-seen sequence
        !! ( %code{$seen},
             # Plus the encoding for the rest of the string...
             encode( @uncompressed,
                     # Add encoding for new sequence to table
                     code => %( %code, $seen~$next => %code.elems ),
                     # Continue encoding from next character
                     seen => $next
             )
           )
}


# Convert to codepoints...
my @codes = compress('To be or not to be. That be the question, matey!');
say @codes;
separator;

# Emit as characters...
say @codes>>.chr;
separator;

# Convert to a binary sequence...
my $bits_per_code = @codes.max.log(2).ceiling();
my $format = '%0' ~ $bits_per_code ~ 'b';
my $bits = @codes>>.fmt($format).join;
say $bits;
separator;

say $bits.comb(/.**1..7/).map({:2($^bitpattern).chr}).join;
separator;





sub separator { say '_' x 50 }


