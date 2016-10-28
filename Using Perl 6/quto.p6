use v6;
my $poem='larry Wall';
my @primes='Larry','boly','Wsaton';
my %dev='rakudo'=>'star','niecza'=>'perl6';



say Q :b /\t\n/; # tab and new line character
say Q :s /$poem/; # content of $poem
say Q :a /@primes[]/; # all number separated by single spaces
say Q :a /@primes[0]/; # returns '2', the first prime
say Q :a /me@primes.de/; # returns literally the mail adress, you need the square braces to interpolate arrays
say Q :h /%dev{}/; # all developer names (values, not keys) separated by single spaces, angle brackets work too
# say Q :h /%dev[rakudo] %dev<niecza>/; # just 2 values
say Q :h /%dev/; # literally '%dev', you need braces here too
say Q :c /There are {2**6} hexagrams in I Ging./; # returns: 'There are 64 hexagrams in I Ging.', inserts the result of the closure
say Q :c /Perl 6 Compiler: {%dev.keys}./; # use it too for method calls
say Q :h /Perl 6 Compiler: %dev.keys./; # no interpolation
# say Q :f :a /Here it Tom with the weather: &fetch_report($day)./; # inserts report of that day, even inside Strings the correctness of arguments will be checked!
# say Q :f :a /fetch_report($day)/; # interpolates just $day
# say Q :f :a /&fetch_report/; # literal string '&fetch_report', even if the subroutine takes no arguments
# sub fetch_report() {
# say Q :s/today is $day/;
# }


say 'Welcome in Larry\'s madhouse';
say  '\'\\'; # string contains: '\
say q |\||; # string contains: |