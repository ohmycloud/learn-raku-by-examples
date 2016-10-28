class Dog {
    method talk {‘bark’}
}

class TalkingDog is Dog {
    method talk {‘Hello’}
} 

my TalkingDog $td .= new;
say $td.talk;
say $td.?talk;

say $td.*talk;
say $td.+talk;

say $td.*caculate_pi;
say $td.caculate_pi;
say $td.?caculate_pi; # Nil
say $td.+caculate_pi; # dies