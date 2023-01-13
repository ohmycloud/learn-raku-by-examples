grammar NString {
    regex n-chars ($length) { [<.ignore>* \w]**{ $length } }
    regex ignore { \s }
    }

class NString::Actions {
    method n-chars ($/) {
        put "Found $/";
        }
    }

my $string = 'The quick, brown butterfly';

loop {
    state $from = 0;
    my $match = NString.subparse(
        $string,
        :rule('n-chars'),
        :actions(NString::Actions),
        :c($from++),
        :args( 5, )
        );

    last unless ?$match;
    }
