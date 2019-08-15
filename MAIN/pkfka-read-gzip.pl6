use PKafka::Consumer;
use PKafka::Message;
use PKafka::Producer;
use Archive::Libarchive; 

sub MAIN ()
{
    my $brokers = "127.0.0.1";
    my $test = PKafka::Consumer.new( topic=>"dc-diagnostic-report", brokers=>$brokers);

    $test.messages.tap(-> $msg
    {
        given $msg
        {
            when PKafka::Message
            {
                say "got offset: {$msg.offset}";
                my $a = Archive::Libarchive.new: operation => LibarchiveRead, file => $msg.payload;
                my Archive::Libarchive::Entry $e .= new;
                while $a.next-header($e) {
                    $e.pathname.say;
                    $a.data-skip;
                }

                $a.close;

            }
            when PKafka::EOF
            {
                say "Messages Consumed { $msg.total-consumed}";
            }
            when PKafka::Error
            {
                say "Error {$msg.what}";
                $test.stop;
            }
        }
    });


    my $t1 = $test.consume-from-beginning(partition=>0);

    await $t1;
}
