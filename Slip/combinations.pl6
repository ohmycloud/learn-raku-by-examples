my @a = ('a', 'b', 'c', 'd', 'A', 'B', 'C', 'D');
for 1..@a.elems {
    for @a.combinations($_) { 
        for |$_.permutations()  -> $p { 
            $p.join().say
        } 
    }
}


