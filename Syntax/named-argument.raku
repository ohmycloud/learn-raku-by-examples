class C0           { method m        { dd %_; say 'm called' } }
class C1           { method m(*% ()) { dd %_; say 'm called' } }
class C2 is hidden { method m        { dd %_; say 'm called' } }

my $c0 = C0.new;
$c0.m(:unexpected, :yet-another-named-param); # OUTPUT: «m called»

my $c1 = C1.new;
#$c1.m();
#$c1.m(:unexpected);

my $c2 = C2.new;
#$c2.m(:unexpected);

sub f(:$group-name!, *@ids (Int $x, Int $y?, Int $z?, Int $zz?)) {
    dd $group-name;
    dd @ids;
}

f(:group-name("Moar"), [1]);
f(:group-name("Raku"), [1,2]);
f(:group-name("Rakudo"), [1,2,3,4]);
f(:group-name("Zef"), [1,2,3,4,5,6,7,8]);