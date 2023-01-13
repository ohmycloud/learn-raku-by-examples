my Supplier $s = Supplier.new;
my Tap $tap = $s.Supply.on-close({ say "Tap closed" }).tap(
    -> $v { say "the value is $v" },
    done    => { say "Supply is done" },
    quit    => -> $ex { say "Supply finished with error $ex" },
);

my $promise1 = start {
    $s.emit('Raku') for 1..5;
}

my $promise2 = start {
    $s.emit('Do') for 1..5;
}

await $promise1, $promise2;
$s.done;    # OUTPUT: «Supply is done␤»
$tap.close; # OUTPUT: «Tap closed␤»