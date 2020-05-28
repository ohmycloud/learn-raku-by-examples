use v6;

# Can restrict a parameter to only accept arguments of a certain type.


sub show_dist(Str $from, Str $to, Int $kms) {
    say "From $from to $to is $kms km.";
}
show_dist('Kiev', 'Lviv', 469);
show_dist(469, 'Kiev', 'Lviv'); #  Error!