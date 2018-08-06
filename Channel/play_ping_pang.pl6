# https://blog.matatu.org/ping-pong

class Player {
    has $.sound handles 'Str';
    has $.opponent is rw;
    has $.channel handles <send receive> = Channel.new;
    has $.promise;
 
    method missed {
        $.promise.status == Kept;
    }
    method play {
        $!promise = start {
            while self.receive -> $n {
                last if (^4).pick==1;
                print "{$.sound} $n ";
                self.opponent.send: $n + 1;
            }
        }
    }
}
 
my @sounds = <ping pong>;
my @players = @sounds.map: { Player.new(:$^sound) }
@players».opponent «=» @players.rotate;
my $serving = @players[0];
my %score = @players Z=> 0 xx *;
 
@players».play;
repeat {
  $serving.send(1);
  await Promise.anyof(@players».promise);
  with @players.first({ .missed }) -> $missed {
      print "Miss by $missed.";
      %score{$missed.opponent}++;
      $missed.play;
  }
  say " Score: " ~ %score{@sounds}.join(' to ');
  if %score.values.sum %% 5 {
      $serving .= opponent;
      say "--Now serving: $serving--";
  }
} until %score.values.any >= 11 and (abs [-] %score.values) >= 2;
 
say "\nWinner: " ~ %score.invert.Hash{ %score.values.max };
say "Final Score: " ~ %score{@sounds}.join(' to ');