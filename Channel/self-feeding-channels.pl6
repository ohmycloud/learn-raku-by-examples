#!/usr/bin/env perl6

my Channel $c .= new;
my Channel $c2 = $c.Supply.batch( elems => 2).Channel;
my Channel $output .= new;
my $count = 0;
$c.send(1) for ^2;

my $more-work = start react whenever $c2 -> @item {
    if ( $count++ < 64 ) {
        $c.send( @item[1]);
	my $sum = sum @item;
	$c.send( $sum );
	$output.send( $sum ); 
    } else {
	$c.close;
    }

} for ^2;

await $more-work;
loop {
    if my $item = $output.poll {
	$item.say
    } else {
	$output.close;
    }
    if $output.closed  { last };
}


