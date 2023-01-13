sub MAIN(:$host = 'localhost', :$port = 3333) {
    react {
        whenever IO::Socket::Async.connect($host, $port) -> $conn {
            react {
                whenever Supply.interval(0.1) {
                    my $p = $conn.print(123456);
                    $p.then({sleep 0.01; .result.say});
                    $p.result;
                }
            }
        }
    }
}