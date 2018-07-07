use v6;

# Scala:
#      val langs = Seq(
#        ("Scala",   "Martin", "Odersky"),
#        ("Clojure", "Rich",   "Hickey"),
#        ("Lisp",    "John",   "McCarthy"))
#      for (tuple <- langs) {
#        tuple match {
#          case ("Scala", _, _) => println("Found Scala")
#          case (lang, first, last) =>
#            println(s"Found other language: $lang ($first, $last)")
#        }
# }


my @langs = (
       ("Scala",   "Martin", "Odersky"),
       ("Clojure", "Rich",   "Hickey"),
       ("Lisp",    "John",   "McCarthy")
       );

for @langs -> $l {
    given $l {
        when ("Scala", $, $) { say "Found Scala" };
        when ($, "John", $)  { say "Found John"  };
    }
}


for 1...4 -> $i {
    given $i {
        when $  { say "even: $i" if $i % 2 ==0}
    }
}

class Address {
    has Str $.street;
    has Str $.city;
    has Str $.country;
}

class Person {
  has Str $.name;
  has Int $.age;
  has $.address;
}

my $alice   = Person.new(:name("Alice"), :age(25), :address(Address.new(:street("1 Scala Lane"), :city("Chicago"), :country("USA"))));
my $bob     = Person.new(:name("Bob"), :age(29), :address(Address.new(:street("2 Java Ave."), :city("Miami"), :country("USA"))));
my $charlie = Person.new(:name("Charlie"), :age(32), :address(Address.new(:street("3 Python Ct."), :city("Boston"), :country("USA"))));

for ($alice, $bob, $charlie) {
    when $_ eqv Person.new(:name("Alice"),:age(25), :address(Address.new(:street("1 Scala Lane"), :city("Chicago"), :country("USA")))) {
      say "Hi Alice!";
    }
    when $_ eqv Person.new(:name("Bob"), :age(29), :address(Address.new(:street("2 Java Ave."), :city("Miami"), :country("USA")))) {
       say "Hi Bob!"
    }
    when Person {
      say "Who are you, {.age} year-old person named {.name}?";
    }
}

# val alice   = Person("Alice",   25, Address("1 Scala Lane", "Chicago", "USA"))
# val bob     = Person("Bob",     29, Address("2 Java Ave.",  "Miami",   "USA"))
# val charlie = Person("Charlie", 32, Address("3 Python Ct.", "Boston",  "USA"))
#
# for (person <- Seq(alice, bob, charlie)) {
#   person match {
#     case Person("Alice", 25, Address(_, "Chicago", _) => println("Hi Alice!")
#     case Person("Bob", 29, Address("2 Java Ave.", "Miami", "USA")) => println("Hi Bob!")
#     case Person(name, age, _) => println(s"Who are you, $age year-old person named $name?")
#   }
# }
