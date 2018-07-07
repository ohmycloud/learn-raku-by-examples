use v6.d.PREVIEW;

    my $channel = Channel.new;

    my @ten_tasks = (^10).map: {
        start {
            my $thread = $*THREAD.id;
            await $channel;
            say "HOLY MOLEY SOMEONE STOLE MY THREAD" if $thread != $*THREAD.id;
        }
    }

    $channel.send("Ring ring") for ^10;
    $channel.close;

    await @ten_tasks;
