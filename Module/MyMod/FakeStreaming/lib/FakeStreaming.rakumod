use PKafka::Producer;
use Colorizable;

unit class FakeStreaming:ver<0.0.1>;

has $.host is rw       = '0.0.0.0';
has $.port is rw       = 3333;
has $.vin is rw        = 'LSJA0000000000091,LSJA0000000000092';
has $.last_meter is rw = 0;
has $.sleeping is rw   = 5;
has $.rate is rw       = 1;
has Str $.brokers is rw    = "127.0.0.1";
has Str $.topics is rw     = "xs6-nation-test";
has Int $.partitions is rw = 6;

method feed() {
    react {
            whenever IO::Socket::Async.listen($!host, $!port) -> $conn {
                react {
                    my Bool:D $ignore = True;

                    whenever Supply.interval($!sleeping).rotor(1, 1 => 1) {
                        $ignore = !$ignore;
                        say "\n\n";
                    }

                    whenever Supply.interval($!rate) {
                        next if $ignore;
                        my @vin = $!vin.split(',');
                        $!last_meter++;
                        for @vin -> $vin {
                            print sprintf("\{'vin':'%s','createTime':%s,'mileage':%s}\n", $vin, DateTime.now.posix * 1000, $!last_meter);
                            $conn.print: sprintf("\{'vin':'%s','createTime':%s,'mileage':%s}\n", $vin, DateTime.now.posix * 1000, $!last_meter);
                        }
                    }

                    whenever signal(SIGINT) {
                        say "Done.";
                        done;
                    }
                }
            }

            CATCH {
                default {
                    say .^name, ': ', .Str;
                    say "handled in $?LINE";
                }
            }
    }
}

method producer() {            
    react {
            my $producer = PKafka::Producer.new(topic => $!topics, brokers => $!brokers);
            my Bool:D $ignore = True;
            whenever Supply.interval($!sleeping).rotor(1, 1 => 1) {
                $ignore = !$ignore;
            }

            whenever Supply.interval($!rate) {
                next if $ignore;
                $!last_meter++;
                my @vin = $!vin.split(',');
                for @vin -> $vin {
                    print sprintf("\{'vin':'%s','createTime':%s,'mileage':%s}\n", $vin, DateTime.now.posix * 1000, $!last_meter);
                    my Int $partition = (0..^$!partitions).pick;
                    my Str $payload = sprintf("\{'vin':'%s','createTime':%s,'mileage':%s}", $vin, DateTime.now.posix * 1000, $!last_meter);
                    my Str $key = $!vin;
                    $producer.put(partition => $partition, payload => $payload, key => $key);
                }
            }

            whenever signal(SIGINT) {
                say "Done.";
                done;
            }
    }
}

method multi-trips() {
    react {
            whenever IO::Socket::Async.listen($!host, $!port) -> $conn {
                react {
                    my Bool:D $ignore = True;

                    whenever Supply.interval($!sleeping).rotor(1, 1 => 1) {
                        $ignore = !$ignore;
                        say "\n\n";
                    }

                    whenever Supply.interval($!rate) {
                        next if $ignore;
                        my @vin = $!vin.split(',');
                        my $chargest = (0..9).pick;
                        $!last_meter++;
                        for @vin -> $vin {
                            my $json-str = sprintf("\{'vin':'%s','ts':%s,'mileage':%s,'chargest':%s}", $vin, DateTime.now.posix * 1000, $!last_meter,$chargest) but Colorizable;
                            given $vin {
                                when 'LSJA0000000000091' { say $json-str.red;   }
                                when 'LSJA0000000000092' { say $json-str.green; }
                            }
                          $conn.print: sprintf("\{'vin':'%s','ts':%s,'mileage':%s,'chargest':%s}\n", $vin, DateTime.now.posix * 1000, $!last_meter,$chargest);
                        }
                    }

                    whenever signal(SIGINT) {
                        say "Done.";
                        done;
                    }
                }
            }

            CATCH {
                default {
                    say .^name, ': ', .Str;
                    say "handled in $?LINE";
                }
            }
    }
}

=begin pod

=head1 NAME

FakeStreaming - blah blah blah

=head1 SYNOPSIS

=begin code :lang<perl6>

use FakeStreaming;

=end code

=head1 DESCRIPTION

FakeStreaming is ...

=head1 AUTHOR

 <>

=head1 COPYRIGHT AND LICENSE

Copyright 2019 

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
