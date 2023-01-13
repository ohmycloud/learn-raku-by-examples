role Canine {
    has $.color;
    #method bark { ... } # the ... indicates a stub 
    #method run { say self.color ~ " Running" }
}

class Dog is Canine {
    has $.color;
    #method bark {say "woof" } # *MUST* be implemented by class 
    #method run {say "Running" }
}

my $dog = Dog.new(color => "1we");
say $dog;
say $dog.color.^HOW;
#$dog.run;