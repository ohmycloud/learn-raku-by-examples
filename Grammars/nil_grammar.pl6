my $str = q:to/END/;
bar baz, bak
END

class Actions {
    method arg-separator ($match-data) {
        my $match-str = $match-data.Str;
        # if $match-str ~~ /^ \s+ $/ {
        #     make ", ";
        # }
        # else {
        #     make $match-str;
        # }
        if $match-str ~~ /^ \s+ $/ {
            $match-data.make(", ");
        } else {
           $match-data.make($match-str);
        }
    }
}

grammar Simple-Grammar {
    token TOP { ^ \s* [[<argument> <arg-separator>]* <argument>] \s* $ }

    token argument {
        [<!before <arg-separator>> . ]+
    }

    token arg-separator {
        [<!before <eos>> \s+] || [\s* ',' [<!before <eos>> \s*]]
    }

    token eos { \s* $ }
}

say Simple-Grammar.parse( $str, actions => Actions.new);
