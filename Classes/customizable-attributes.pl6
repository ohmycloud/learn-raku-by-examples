#!/usr/bin/env perl6

my $ⲧ = " " xx 4;
class Journey {
    has $.origin;
    has $.destination;
    has @.travelers;
    has Str $.notes is rw;

    multi method notes() { "$!notes\n" };
    multi method notes( Str $note ) { $!notes ~= "$note\n$ⲧ" };

    method Str { "⤷ $!origin\n$ⲧ" ~ self.notes() ~ "$!destination ⤶\n" };
}

my $trip = Journey.new( :origin<Here>, :destination<There>,
			travelers => <þor Freya> );

$trip.notes("First steps");
$trip.notes("Almost there");
print $trip;
