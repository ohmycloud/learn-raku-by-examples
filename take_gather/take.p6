sub weird(@elems, :$direction = 'forward') {
    my %direction = (
        forward  => sub { take $_ for @elems },
        backward => sub { take $_ for @elems.reverse },
        random   => sub { take $_ for @elems.pick(*) },
    );
    return gather %direction{$direction}();
}

say weird(<a b c>, :direction<backward> );          # (c b a)