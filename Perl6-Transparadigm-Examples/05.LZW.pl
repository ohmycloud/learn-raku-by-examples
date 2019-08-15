#! /usr/bin/env perl6
use v6;

sub compress(Str $uncompressed --> List)  {
    # Build a look-up table of encoded representations
    # (each ASCII char represented by its equivalent codepoint)
    my %code_for = map { $^ASCII.chr => $^ASCII }, ^256;

    # Loop and collect each encoding...
    gather {
        # Track which characters we've seen but not yet encoded
        my $already_seen = "";

        # Walk through each single character...
        for $uncompressed.comb -> $next_char {
            # Now we've seen that next character as well
            my $now_seen = $already_seen ~ $next_char;

            # If new char sequence is known, keep looking
            if %code_for{$now_seen}:exists {
                $already_seen = $now_seen;
            }
            # Otherwise, we have an unknown sequence of chars
            else {
                # Emit encoding for what we've previously seen
                take %code_for{$already_seen};
                # Add encoding for new unknown sequence to table
                %code_for{$now_seen} = %code_for.elems;
                # Restart the current sequence from this char
                $already_seen = $next_char;
            }
        }
        # Emit the encoding for the final sequence (if any)
        take %code_for{$already_seen} if $already_seen ne "";
    }
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

