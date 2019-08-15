class Paper   { }
class Scissor { }
class Stone   { }

multi win(Paper   $a, Stone   $b) { 1 }
multi win(Scissor $a, Paper   $b) { 1 } 
multi win(Stone   $a, Scissor $b) { 1 } 
multi win(Any     $a, Any     $b) { 0 }

say win(Paper.new, Scissor.new); # 0 
say win(Stone.new, Stone.new); #0 
say win(Paper.new, Stone.new); #1
