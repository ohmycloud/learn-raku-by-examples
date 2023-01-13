#! /usr/bin/env perl6
use v6;

say tree_hash('123456789' x 1_000).list>>.fmt("%02x").join;



constant MB = 1024 ** 2;

# Construct the final tree-hash for some data
sub tree_hash (Str $data, Int $chunk_size = MB) {
    # Build the tree...
    build_tree
        # ...from chunks of fixed size, sha'd in parallel...
        $data.comb(/ . ** {1..$chunk_size} /)».&sha256

}

# Build a tree from multiple nodes..
multi build_tree (@nodes)  {
    # Build the next level of the tree...
    build_tree
        # ...by sha'ing the concatenation of adjacent pairs of nodes...
        map -> $a, $b? { $b ?? sha256($a ~ $b) !! $a },
            # ...from the list of nodes...
            @nodes
}

# The tree of a single node, is just that node...
multi build_tree ([$node]) {
    $node
}

use Digest::SHA;


