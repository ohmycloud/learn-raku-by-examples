my $p = Promise.start({ sleep 2; 42});
$p.then({ say .result; say .result });   # will print 42 once the block finished 
say $p.status;              # OUTPUT: «Planned␤» 
$p.result;                  # waits for the computation to finish 
say $p.status;              # OUTPUT: «Kept␤»