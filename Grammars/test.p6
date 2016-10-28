use v6;
#use Grammar::Debugger;

grammar Lines {
    token TOP {
        ^ <line>+ $
    }

    token line {
        \[
        <student>+ % <semicolon>
        \]
        \n
    }

    token student {
       <myname>+ % <comma>
    }

    token myname {
        <[A..Za..z-]>+
    }

    token comma {
        ',' \s+
    }

    token semicolon {
        ';' \s+
    }

}

my $parse = Lines.parsefile('test.txt');
say $parse;
