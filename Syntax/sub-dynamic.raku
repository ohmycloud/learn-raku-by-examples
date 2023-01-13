sub start {
    my $*something = 'foobar';
    
    # WORKS
    say 'first say-something:';
    say-something;
    
    # WORKS
    say 'mapped say-something, no return:';
    my @foo = (^2).map({say-something});
    
    # ERROR: Dynamic variable $*something not found
    say 'mapped say-something, with return:';
    return (^2).map({say-something});
}

sub say-something {
    say $*something;
    1
}

start;