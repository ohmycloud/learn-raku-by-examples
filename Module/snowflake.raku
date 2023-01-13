use SnowFlake;

my $worker = SnowFlake.new(worker_id => 1, sequence => 2);

for 1..10_000_000 {
    $worker.get_id();
}

say now - INIT now;