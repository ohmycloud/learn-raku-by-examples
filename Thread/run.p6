my $t = Thread.new(
        name => 'My thread',
        code => sub {
            say 'Start';
            sleep 2;
            say 'End';
        }
);

say 'Before';
$t.run();
say 'After';