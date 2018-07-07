my int $b;
    await (^5).map: {
        start { ++$b for ^100000 }
    }
say $b; # something like 419318

my int $a;
    my $l = Lock.new;
    await (^5).map: {
       start {
           for ^100000 {
               $l.protect( { ++$a } )
           }
       }
    }
say $a; # 500000

my atomicint $c;
    await (^5).map: {
        start { ++⚛$c for ^100000 }
    }
    say $c; # 500000
