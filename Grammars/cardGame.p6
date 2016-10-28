grammar CardGame {
 
    rule TOP { ^ <deal> $ }
 
    rule deal {
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
 
say CardGame.parse("2♥ 5♥ 7♦ 8♣ 9♠");
say CardGame.parse("2♥ a♥ 7♦ 8♣ j♥");
