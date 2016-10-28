my @promises = ^3 .map: {
    start {
        .say; sleep 1;
        $_ * 4;
    }
};

say "Started! {now - INIT now}";
say await @promises;
say "All done! {now - INIT now}";