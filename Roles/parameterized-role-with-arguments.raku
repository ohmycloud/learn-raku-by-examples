#!/usr/bin/env perl6

enum Severity <debug info warn error critical>;

role Logging[$filehandle = $*ERR] {
    method log(Severity $sev, $message) {
        $filehandle.print("[{uc $sev}] $message\n");
    }
}

Logging[$*OUT].log(debug, 'here we go'); # OUTPUT: «[DEBUG] here we go␤»


#| https://stackoverflow.com/questions/38816496/override-attribute-of-a-role
role R[$d] {
    has $.a = $d
}

class C does R["default"] { };

my $c = C.new;
dd $c;
# OUTPUT«C $c = C.new(a => "default")␤»