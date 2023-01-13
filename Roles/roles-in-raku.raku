role Canine {
    has $.color;
    method bark { ... } # the ... indicates a stub 
    method run { say self.color }
}

class Dog does Canine {
    #has $.color;
    method bark {say "woof" } # *MUST* be implemented by class 
    method run { self.Canine::run }
}

my $dog = Dog.new(color => "1we");
$dog.bark;
$dog.run;