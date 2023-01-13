# If you need to have an action that runs when the supply finishes, 
# you can do so by setting the done and quit options in the call to tap:

my Supplier $supplier = Supplier.new();
my Supply $supply = $supplier.Supply;

# If you need to have an action that runs when the supply finishes, 
# you can do so by setting the done and quit options in the call to tap:
my Tap $t = $supply.tap: { say "[$_]" },
    done => { say 'Job is done.' },
    quit => {
         say "App Error: ";
    };

for 1..5 {
    $supplier.emit($_);
}

$t.close;

# The quit block works very similar to a CATCH. If the exception is marked as seen by a when or default block, the exception is caught and handled. Otherwise, 
# the exception continues to up the call tree (i.e., the same behavior as when quit is not set).