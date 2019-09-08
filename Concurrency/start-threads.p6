say $*THREAD;

my $t1 = Thread.start(name => 'Test 1', sub {say $*THREAD});
my $t2 = Thread.start(name => 'Test 2', sub {say $*THREAD});
my $t3 = Thread.start(name => 'Test 3', sub {say $*THREAD});

say $t1.WHAT;
say $t2.WHAT;
say $t3.WHAT;