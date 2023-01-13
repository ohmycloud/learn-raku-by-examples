role Monser {
    has Str $.name;
    # Stubs
    method get-attack( --> Int ) { ... }
    method get-defence( --> Int ) { ... }
    method show-info {
        say '名字: ' ~ self.name;
        say '攻击力: ' ~ self.get-attack;
        say '防守力: ' ~ self.get-defence;
    }
}

class Slime does Monser {
    method get-attack( --> Int )  {
        return 15;
    }
    method get-defence( --> Int ) {
        return 10;
    }
}

class Dragon does Monser {
    method get-attack( --> Int )  {
        return 60;
    }
    method get-defence( --> Int ) {
        return 45;
    }
}

my $slime = Slime.new( name => 'Slime' );
my $dragon = Dragon.new( name => 'Dragon' );

$slime.show-info;
$dragon.show-info;