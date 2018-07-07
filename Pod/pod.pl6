#!/usr/bin/env perl6

use v6;

use Pod::To::HTML;

my $link="See L<https://modules.perl6.org/> .";
my $pod=qq:to/END/;
=pod
$link
=pod		    
}
END
say $pod;

use MONKEY-SEE-NO-EVAL;   
say pod2html(EVAL($pod ~ "\n\$=pod"));
