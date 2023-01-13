#!/usr/bin/env perl6

sub MAIN() {
    my @a = Date.new('2021-02-01') .. Date.new('2021-02-17');
    my @b = 1,2,3,4;
    my @c = 4,5,6,7;

    # operator
    say @b »+« @c;
    say @b «+» @c;

    say @b »+» 1;
    say 1 «+« @b;

    # method call
    say @b».sin;
    my $b = 3;

    # set operator
    if $b ∈ @b { say "OK" }
    if $b ∉ @b { say "NOT OK" }
    say $b ∋ @b; # (cont)
    say $b ∌ @b;

    
    
    
    
    
    
    
    
    
    
    

    say 'I don\'t ♥ 北京';
    say '北京';
}
