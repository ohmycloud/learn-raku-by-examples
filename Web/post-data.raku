use WWW;

sub MAIN( :$have-data = 0 ) {
    my $url='https://jsonplaceholder.typicode.com/posts/';
    my %args=%(form-data => "userId=1&id=2");
    my $data = "";

    if $have-data {
        $data = %args{'form-data'};
    }

    my $res;
    if $data {
        $res = post $url, $data;
    } else {
        $res= get $url~'1';
    }
    say $res;
}
