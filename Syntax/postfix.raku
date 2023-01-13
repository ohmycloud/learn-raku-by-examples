# sub postfix:< ! >(Int $num where $num >= 0) { [*] 1..$num }

# say 5!;

# sub postfix:<♥ >( $a ) {  „I love $a!“ }
# say 'Raku'♥;


#for (1,2,3){
#    print "counting $_!\n";
#}

# for 1,2,3 {
#     print "counting $_!\n";
# }

# my $letter = q:to/END/;
#   Foo, bar, baz
#       <- all the preceding spaces are included in the heredoc.
# END

# print $letter;

# my $letter = q:to/END/;
#   Foo, bar, baz
#       <- All the preceding spaces are included in the heredoc.
# END

# print $letter;


# say Q 'this will work, because of space after Q';
# say Q    (this will work, also because of space after Q);


# say Q^This works!^;
# say Q ^so does this^;
# say Q!This works!;
# say Q !This works!;

my @rakudo-people = <scott patrick carl moritz jonathan jerry stephen>;

# @rakudo-people
#     ==> grep { /at/ } ==> map { .uc } \
#     ==> my @who-it's-at;

@rakudo-people
    ==> grep( { /at/ } )
    ==> map( { .uc } )
    ==> my @who-it's-at;

say ~@who-it's-at;

# my %hash = 'a' .. 'j' Z=> 0..9;

# Error, indexing uses postfix operators
#say %hash <a>;

# Works
# say %hash<j>;

# sub call-this-subroutine(@arguments) { say @arguments; }

# call-this-subroutine( [1,2,3] );  # Works
# call-this-subroutine( [1,2,3] ); # Works

# my $x = 5;
# say ++ $x;  # Works
# say ++$x;   # Works