#! /usr/bin/env perl6
use v6;

say tree_hash('123456789' x 1_000).list>>.fmt("%02x").join;



constant MB = 1024 ** 2;

# Construct the final tree-hash for some data
sub tree_hash (Str $data, Int $chunk_size = MB) {

    # Collect the initial chunks of data in this
    my @chunks;

    # Step through the data...
    loop (my $next = 0; $next < $data.chars; $next += $chunk_size) {
        # Adding each chunk...
        @chunks.push(
            # ...having extracted and sha'd it...
            sha256( $data.substr($next, $chunk_size) )
        );
    }

    # Finally, build the tree-hash out of those accumulated chunks
    return build_tree( @chunks );
}

# Iteratively boil the chunks down to one...
sub build_tree (@nodes is rw) {

    # While not yet sufficiently boiled down...
    while @nodes > 1 {
        # Create a new set of N/2 nodes
        my @new_nodes;

        # By taking two nodes at a time...
        for @nodes -> $a, $b? {
            # ...and sha'ing their concatenation
            @new_nodes.push( $b ?? sha256($a ~ $b) !! $a )
        }

        # Then replace the old N nodes with the new N/2
        @nodes = @new_nodes;
    }

    # In the end there can be only one!
    return @nodes[0];
}

use Digest::SHA;

