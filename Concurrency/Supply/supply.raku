#!/usr/bin/env perl6

sub start-server(Supply $s, &operator --> Supply) {
    supply {
        sub server() {
            whenever $s -> $msg {
                if $msg ~~ Int || (try so $msg.Int) {
                    emit &operator($msg.Int);
                } else {
                    die "Need an integer!";
                }
            }
        }
        server();
    }
}

sub auto-restart(Supply $s --> Supply) {
    supply {
        sub auto() {
            whenever $s -> $msg {
                say "RESULT => " ~ $msg;
                QUIT {
                    default {
                        .note;
                        "Ready to restart server".say;
                        auto();
                    }
                }
            }
        }
        auto();
    }
}

my $supplier = Supplier.new;
my $supply   = $supplier.Supply;
my $server   = start-server($supply, -> $v { 2 * $v.Int });
my $s        = auto-restart($server);

$s.tap;

while (my $get = prompt("Input a number:")) {
    $supplier.emit($get);
}
