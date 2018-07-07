use v6;

class Address {
    has $.street;
    has $.city;
    has $.country;
}

class Person {
  has $.name;
  has $.age;
  has $.address;
}

my $alice   = Person.new(:name("Alice"), :age(25), :address(Address.new(:street("1 Scala Lane"), :city("Chicago"), :country("USA"))));
my $bob     = Person.new(:name("Bob"), :age(29), :address(Address.new(:street("2 Java Ave."), :city("Miami"), :country("USA"))));
my $charlie = Person.new(:name("Charlie"), :age(32), :address(Address.new(:street("3 Python Ct."), :city("Boston"), :country("USA"))));

for ($alice, $bob, $charlie) {
    when Person.new(:name("Alice"),:age(25), :address(Address.new())) {
      say "Hi Alice!";
    }
    when * eqv Person.new(:name("Bob"), :age(29), :address(Address.new(:street("2 Java Ave."), :city("Miami"), :country("USA")))) {
       say "Hi Bob!"
    }
    when Person {
      say "Who are you, {.age} year-old person named {.name}?";
    }
}


for (1, 2, 2.7, "one", "two", "four") {
  say "int 1" when 1;
  say "other int $_" when Int | Numeric;
  say "string one" when "one";
  say "other string $_" when Str;
  default { say "unexpected" }
}
