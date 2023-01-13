#IO::Notification.watch-path(".").act( { say "$^file changed" } );
".".IO.watch.act( { say "$^file changed" } );   # same