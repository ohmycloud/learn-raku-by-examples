my $socket = await IO::Socket::Async.connect:
    'moarvm.org', 80;

await $socket.print:
    "GET / HTTP/1.0\r\nHost: moarvm.org\r\n\r\n";

react {
    whenever $socket -> $chars {
        print $chars;
    }
}
