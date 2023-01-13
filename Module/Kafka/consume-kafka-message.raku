use PKafka::Consumer;
use PKafka::Message;

sub MAIN ( :$brokers = '127.0.0.1:9092',
           :$topic = 'test') {
    my $test = PKafka::Consumer.new( :$topic, :$brokers);

    $test.messages.tap(-> $msg 
    {
        given $msg 
        {
            when PKafka::Message
            {
                say "got {$msg.offset}: { $msg.payload-str.encode('utf8') } ";
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

    my $t1 = $test.consume-from-end(partition=>0);
    my $t2 = $test.consume-from-end(partition=>1);

    await $t1;
    await $t2;
}
