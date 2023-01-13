react {
    whenever IO::Socket::Async.listen('localhost', 5000) -> $conn {
        whenever $conn.Supply.lines -> $line {
            say $line;
            $conn.print: $line;
            $conn.close;
        }

        whenever signal(SIGINT) {
            say "Done.";
            done;
        }
    }
    CATCH {
        default {
            say .^name, ': ', .Str;
            say "handled in $?LINE";
        }
    }
}