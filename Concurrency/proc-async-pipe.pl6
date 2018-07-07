#!/usr/bin/env perl6

use v6;

my $proc = Proc::Async.new("tail", "-f", "/var/log/system.log", :out);
 
react {
    whenever $proc.stdout.lines { # split input on \r\n, \n, and \r 
        say ‘line: ’, $_
    }
    whenever $proc.stderr { # chunks 
        say ‘stderr: ’, $_
    }
    whenever $proc.ready {
        say ‘PID: ’, $_ # Only in Rakudo 2018.04 and newer, otherwise Nil 
    }
    whenever $proc.start {
        say ‘Proc finished: exitcode=’, .exitcode, ‘ signal=’, .signal;
        done # gracefully jump from the react block 
    }
    whenever signal(SIGTERM).merge: signal(SIGINT) {
        once {
            say ‘Signal received, asking the process to stop’;
            $proc.kill; # sends SIGHUP, change appropriately 
            whenever signal($_).zip: Promise.in(2).Supply {
                say ‘Kill it!’;
                $proc.kill: SIGKILL
            }
        }
    }
}
 
say ‘Program finished’;
