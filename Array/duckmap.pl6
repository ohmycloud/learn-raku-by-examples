# https://stackoverflow.com/questions/45844816/how-can-i-idiomatically-ignore-undefined-array-elements-or-avoid-assigning-them

my @bar = 1, 2, Any;

@bar.duckmap: -> Mu:D $baz {
    put $baz;
}

duckmap -> Mu:D $baz {
    put $baz;
}, @bar;


# the “:” makes this a method call
duckmap @bar: -> Mu:D $baz {
    put $baz;
}

for @bar -> $baz {
    put $_ with $baz
}

for @bar {
    with $_ -> $baz {
        put $baz;
    }
}
