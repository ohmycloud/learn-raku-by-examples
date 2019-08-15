use v6.c;

sub fib {
    my @fib = 1, 1, *+*, ... *;
    say @fib[^20];
}

sub MAIN($name) {
    say "hello" ~ $name;
    fib();
}