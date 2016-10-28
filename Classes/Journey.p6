class Journey {
    has $.origin;
    has $.destination;
    has @!travellers;
    has $.notes is rw;

    method add_traveller($name) {
        if $name ne any(@!travellers) {
            push @!travellers, $name;
        } else {
            warn "$name is already going on the journey!";
        } 
    }

    method describe() {
        "From $!origin to $!destination";
    }
    # Private method
    method !do-something-private($x) {
       ($x + 120)*0.88; # 先加价，再打折！
    }

    method price($x) {
        self!do-something-private(2*$x);
    }

}

my $vacation = Journey.new(
    origin      => 'China',
    destination => 'Sweden',
    notes       => 'Pack hiking'
);

say $vacation.origin;
$vacation.notes = 'Pack hiking gear and sunglasses!';
say $vacation.notes;
$vacation.add_traveller('Larry Wall');
say $vacation.price(40);
$vacation.add_traveller('Larry Wall');
