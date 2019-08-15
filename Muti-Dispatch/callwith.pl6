class Wide             {}
class Middle is Wide   {}
class Narrow is Middle {}
multi foo(Narrow $v) { say 'Narrow', $v; 'from Narrow' }
multi foo(Middle $v) {
    say 'Middle', $v;

    my $result = callwith Narrow;
    say "We're back! The return value is $result";

    'from Middle'
}
multi foo(Wide $v) { say 'Wide ', $v; 'from Wide' }

foo Middle;
