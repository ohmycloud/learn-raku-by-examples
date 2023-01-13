my Supplier $emitter = Supplier.new;
my Supply $s = $emitter.Supply;

my $p = start {
    loop {
        $emitter.emit: [42, 'answer', Any].roll;
        sleep 0.25;
    }
}


sub handle-with(Supply:D $s, *@routines) {
    my proto pseudo-multi(|) {*}
    for @routines -> &b {
        &pseudo-multi.add_dispatchee(&b);
    }

    $s.tap: &pseudo-multi;
}

handle-with($s,
    sub (Int $_) { say .WHAT },
    sub (Str $_) { say .WHAT },
    sub (Any:U $_) { say 'undefined' },
);

await $p;