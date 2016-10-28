class Journey {
    has $.origin;
    has $.destination;
    has @!travellers;
    has $.notes is rw;
        
    method add_traveller($name) {
        if $name ne any(@!travellers) {
            push @!travellers, $name;
        }
        else {
            warn "$name is already going on the journey!";
        }
    }
        
    method describe() {
        "From $!origin to $!destination"
    }
}


