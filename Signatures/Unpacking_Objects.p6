use v6;

# Can extract values by attribute (only those that are declared with accessors)

sub nd($r as Rat (:$numerator, :$denominator)) {
    say "$r = $numerator/$denominator";
}
nd(4.2);
nd(3/9);