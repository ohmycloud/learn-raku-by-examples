#| https://adventofcode.com/2022/day/5

my @A = 'N', 'Z';
my @B = 'D', 'C', 'M';
my @C = 'P';

rearrangement();
[@A, @B, @C]».first.join.say;

sub rearrangement() {
    for $=finish.lines -> $line {
        my ($number, $from, $to) = $line.comb(/\d+/)».Int;
        move($number, $from, $to);
    }
}

sub move(Int $n, $from, $to) {
    given ($from, $to) {
        when (1, 2) { A2B($n) }
        when (1, 3) { A2C($n) }
        when (2, 1) { B2A($n) }
        when (2, 3) { B2C($n) }
        when (3, 1) { C2A($n) }
        when (3, 2) { C2B($n) }
    }
}

sub A2B(Int $n) { 
    my @shifted = (1..$n).map(-> \x { @A.shift });
    @B.unshift(|@shifted.reverse);
}
sub A2C(Int $n) { 
    my @shifted = (1..$n).map(-> \x { @A.shift });
    @C.unshift(|@shifted.reverse);
}
sub B2A(Int $n) { 
    my @shifted = (1..$n).map(-> \x { @B.shift });
    @A.unshift(|@shifted.reverse);
}
sub B2C(Int $n) {
    my @shifted = (1..$n).map(-> \x { @B.shift });
    @C.unshift(|@shifted.reverse);
}
sub C2A(Int $n) { 
    my @shifted = (1..$n).map(-> \x { @C.shift });
    @A.unshift(|@shifted.reverse);
}
sub C2B(Int $n) { 
    my @shifted = (1..$n).map(-> \x { @C.shift });
    @B.unshift(|@shifted.reverse);
}

=finish
move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2