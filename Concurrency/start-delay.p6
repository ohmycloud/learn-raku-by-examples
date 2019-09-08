say $*THREAD;

Thread.start(
        name => 'Sleep 3 seconds',
        sub {
            say $*THREAD;
            sleep 3;
            say 1;
        }
);

Thread.start(
        name => 'Sleep 2 seconds',
        sub {
            say $*THREAD;
            sleep 2;
            say 2;
        }
);

Thread.start(
        name => 'Sleep 1 second',
        sub {
            say $*THREAD;
            sleep 1;
            say 3;
        }
)