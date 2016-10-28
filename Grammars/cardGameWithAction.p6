grammar CardGame {
 
    rule TOP { ^ <deal> $ }
 
    rule deal {
       :my %*PLAYED = ();
       <hand>+ % ';'
    }
 
    rule hand { [ <card> ]**5 }
    token card {<face><suit>}
 
    proto token suit {*}
    token suit:sym<♥>  {<sym>}
    token suit:sym<♦>  {<sym>}
    token suit:sym<♣>  {<sym>}
    token suit:sym<♠>  {<sym>}
 
    token face {:i <[2..9]> | 10 | j | q | k | a }
}

class CardGame::Actions {
    method card($/) {
       my $card = $/.lc;
       say "Hey, there's an extra $card"
           if %*PLAYED{$card}++;
   }
}
 
my $a = CardGame::Actions.new;
say CardGame.parse("a♥ a♥ 7♦ 8♣ j♥", :actions($a));
# "Hey there's an extra a♥"
say CardGame.parse("a♥ 7♥ 7♦ 8♣ j♥; 10♥ j♥ q♥ k♥ a♦",
                   :actions($a));
# "Hey there's an extra j♥"

