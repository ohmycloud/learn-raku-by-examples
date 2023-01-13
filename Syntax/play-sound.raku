#!/usr/bin/env raku

use NativeCall;
use Audio::PortAudio;

multi sub MAIN(:$frequency = 440, :$samplerate = 44100 ) {

    sub gen-sin(Int $sample-rate, Int $frequency) {
        gather {
            loop {
                for (0 .. ($sample-rate/$frequency)).map({ sin(($_/($sample-rate/$frequency)) * (2 * pi))}) -> num32 $val {
                    take $val;
                }
            }
        }
    }

    my $chan = Channel.new;

	my $pa = Audio::PortAudio.new;
	my $st = $pa.open-default-stream(0,2, Audio::PortAudio::Float32, $samplerate, 2048);


    start {
        for gen-sin($samplerate, $frequency).rotor(4096) -> @a {
            my $c = CArray[num32].new(flat @a Z @a);
            $chan.send([$c, 4096]);
        }
    }


	$st.start;
    react {
        whenever $chan -> $ ( $samps, $no) {
              $st.write($samps, $no);
        }
    }
}
