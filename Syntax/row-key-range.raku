sub MAIN(
    :start($start) = Date.today.Str, 
    :end($end)     = (Date.today + 1).Str
    ) {
    say $start;    
    my $long-max-value  = 9223372036854775807;
    my $start-time = Date.new($start).DateTime.posix - 28800;
    my $end-time   = Date.new($end).DateTime.posix - 28800;

    for $end-time ... $start-time -> $t {
        say $long-max-value - $t * 1000;
    }
}