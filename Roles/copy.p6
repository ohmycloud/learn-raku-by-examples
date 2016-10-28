role Hammering {
    method hammer($stuff) {
        say "You hammer on $stuff. BAM BAM BAM!";
    }
}

class Hammer does Hammering {}
class Gavel  does Hammering {}
class Mallet does Hammering {}

my $hammer = Hammer.new;    # create a new hammer object
say $hammer ~~ Hammer;      # "Bool::True" -- yes, this we know
say $hammer ~~ Hammering;   # "Bool::True" -- ooh!

my $unkown_object = Gavel.new;
if $unkown_object ~~ Hammering {
    $unkown_object.hammer("that nail over there");     # will always work
}
