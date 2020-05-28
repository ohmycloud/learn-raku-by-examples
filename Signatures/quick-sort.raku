use v6;

# Empty list sorts to the empty list
multi quicksort([]) { () }

# Otherwise, extract first item as pivot...
multi quicksort([$pivot, *@rest]) {

    # Partition.
    my @before = @rest.grep(* < $pivot);
    my @after  = @rest.grep(* >= $pivot);
    # Sort the partitions.
    (quicksort(@before), $pivot, quicksort(@after))
}

my @unsorted = <13 1 9 12 4 2015>;
say quicksort(@unsorted); # 1  4  9  12  13  2015