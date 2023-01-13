use SnowFlake;

my $worker = SnowFlake.new(worker_id => 1, sequence => 2);
my @ids;

@ids.append( $worker.get_id() ) for 1...10000000;

my $duration = now - INIT now;
say sprintf("%-8s %-8s %-20s", @ids.elems, Set(@ids).elems, $duration);