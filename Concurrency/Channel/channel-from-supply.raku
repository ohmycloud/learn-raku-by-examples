# It is also possible to obtain a Channel from a Supply using the Channel method which 
# returns a Channel which is fed by a tap on the Supply:

my $supplier = Supplier.new;
my $supply   = $supplier.Supply;
my $channel  = $supply.Channel;

my $p = start {
    react  {
        whenever $channel -> $item {
            say "via Channel: $item";
        }
    }
}
 
await (^10).map: -> $r {
    start {
        sleep $r;
        $supplier.emit($r);
    }
}
 
$supplier.done;
await $p;

# Channel will return a different Channel fed with the same data each time it is called. 
# This could be used, for instance, to fan-out a Supply to one or more Channels to provide for different interfaces in a program.