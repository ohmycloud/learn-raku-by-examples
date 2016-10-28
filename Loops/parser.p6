use v6;

constant N = 5;
for flat (1..6).roll xx * Z 1..N -> $_, $n {
    print "roll $n: $_ ";

    when 6 {
        put "(won)";
        last;
    }

    default {
        put "(lost)";
    }

    LAST {
        print "result: ";
        when 6 { put "winner :)" }
        default { put "loser :(" }
    }
}
