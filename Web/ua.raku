use HTTP::UserAgent;

my $ua = HTTP::UserAgent.new;
$ua.timeout = 10;

my $response = $ua.get("URL");

if $response.is-success {
    say $response.content;
} else {
    die $response.status-line;
}
