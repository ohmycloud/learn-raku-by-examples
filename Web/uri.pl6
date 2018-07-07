use URI;
my URI $u .= new('http://her.com/foo/bar?tag=woow#bla');
my $scheme = $u.scheme;
my $authority = $u.authority;
my $host = $u.host;
my $port = $u.port;
my $path = $u.path;
my $query = $u.query;
my $frag = $u.frag; # or $u.fragment;
my $tag = $u.query-form<tag>; # should be woow


sub oauth_normalized_url($url){
    my URI $u .= new($url);
    return sprintf('%s://%s%s', $u.scheme, $u.host, $u.path);
}


say oauth_normalized_url('http://her.com/foo/bar?tag=woow#bla');
