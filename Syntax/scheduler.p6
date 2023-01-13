#!/usr/bin/env perl6

class MyScheduler does Scheduler {
    method cue(&code, Instant :$at, :$in, :$every, :$times = 1; :&catch) {
        sleep $at - now if $at && $at > now;
        sleep $in if $in;

        for ^$times {
            code();
            CATCH {
                default {
                    if &catch {
                        catch($_);
                    }
                    elsif self.uncaught_handler {
                        self.uncaught_handler.($_);
                    }
                    else {
                        .throw;
                    }
                }
            }
            sleep $every if $every;
        }

        class { method cancel() { } }
    }

    # We don't really queue jobs, so always return 0 for the load
    method loads(--> 0) { }
}