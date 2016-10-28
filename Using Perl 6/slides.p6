use v6;

#`(
# Read input from the console
print "Enter your name: ";
my $name = $*IN.get;
say "Hi $name!";

# Check a value is in a given range
loop {
print "Enter a number from 1 to 10: ";
my $num = $*IN.get;
unless 1 <= $num <= 10 { say "Fail!" }
# unless $num ~~ 1..10 { say "Fail!" }
}
)

# Add up a list of Numbers

my @nums = 1,5,7,-2,3,9,11,-6,14;
say [+] @nums;

# Check if a list is sorted
my @a = 1, 1, 2, 3, 5, 8;
my @b = 9, 4, 1, 16, 36, 25;
say '@a is sorted' if [<=] @a;
if [<=] @b { say '@b is sorted' }

# Get a Perl-ish representation of a data structure (Data::Dumper style)
my @array = 1, 2, 3;
push @array, { x => 42, y => 100 };
say @array.perl;

# Iterate over a list
my @cities = <Lisbon Tokyo Seoul China>;
for @cities -> $city {
    say "I've been to $city";
}

# Iterate over the keys and values of a hash
my %distances =
Bratislava => 1084,
Stockholm  => 442; 
for %distances.kv -> $city, $distance {
    say "$city is $distance km away";
}

# Check if any of a list of test scores is a pass
my @aa = 75, 47, 90, 22, 80;
my @bb = 61, 77, 94, 82, 60;
my @cc = 45, 59, 33, 11, 19; 
if any(@aa) >= 60 { say "Some passes in A" }
if any(@bb) >= 60 { say "Some passes in B" }
if any(@cc) >= 60 { say "Some passes in C" }

# Check if all of a list of test scores are passes
my @a1 = 75, 47, 90, 22, 80;
my @b1 = 61, 77, 94, 82, 60;
my @c1 = 45, 59, 33, 11, 19; 
if all(@a1) >= 60 { say "All passes in A" }
if all(@b1) >= 60 { say "All passes in B" }
if all(@c1) >= 60 { say "All passes in C" }

# Check if none of a list of test scores is a pass
my @a2 = 75, 47, 90, 22, 80;
my @b2 = 61, 77, 94, 82, 60;
my @c2 = 45, 59, 33, 11, 19; 
if none(@a2) >= 60 { say "No passes in A" }
if none(@b2) >= 60 { say "No passes in B" }
if none(@c2) >= 60 { say "No passes in C" }

# Get a random item from a list
my @drinks = <wine beer vodka>;
say "Tonight I'll drink { @drinks.pick }";

# Shuffle a list into a random order
my @competitors = <Tina Lena Owen Peter>;
my @order = @competitors.pick(*);
.say for @order;

# Write and call a subroutine with parameters
sub greet($name) {
    say "OH HAI $name!";
}
greet("masak");

# Write a subroutine taking an array and a hash
sub example(@array, %hash) {
    say @array.elems;
    say %hash.keys;
}
my @numbers = 42, 57, 74;
my %mapping = a => 1, b => 2;
example(@numbers, %mapping);

# Write a subroutine that only takes a number
sub double(Int $n) { 2 * $n }
say double(21);
#say double("oh no I'm not a number");

# Use multi-subs to react differently by type
multi double2(Int $n) { 2 * $n }
multi double2(Str $s) { $s x 2 }
say double2(21);
say double2("boo");

# Compute factorial (recursively)
multi fact($n) { $n * fact($n - 1) }
multi fact(0)  { 1 }
say fact(1);
say fact(10);

# Compute factorial (using a meta-operator)
sub factorial($n) { [*] 1..$n }
say factorial(1);
say factorial(10);

# Add a new factorial operator (so 10! works)
sub postfix:<!>($n) { [*] 1..$n }
say 1!;
say 10!;

# Declare a class with attributes and a method
class Product {
    has $.name;  # Attr + accessor
    has $.price;
    has $.discount is rw;
                 # Attr + lvalue accessor  
    method get_price {
        return $.price - $!discount;
    }
}

# Instantiate a class and call a method on it
my $prod = Product.new(
    name     => "Beer",
	price    => 500,
	discount => 60
);
say $prod.get_price;

# Get/set attributes through accessors
say $prod.name;
$prod.discount = 40;
say $prod.get_price;
#$prod.name = 'Wine';

# Call a method on every object in a list
my @products =
    Product.new(name => 'Beer', price => 500),
    Product.new(name => 'Wine', price => 450),
    Product.new(name => 'Vodka', price => 1600);
my @uc_names = @products>>.name>>.uc;
.say for @uc_names;

# Introspect a class to find its methods
my @meths = Product.^methods(:local);
.say for @meths>>.name;

# Sort an array of objects by result of a method
my @product =
    Product.new(name => 'Beer', price => 500),
    Product.new(name => 'Wine', price => 450),
    Product.new(name => 'Vodka', price => 1600);
my @sorted = @product.sort(*.name);
for @sorted { .name.say };

# Sort an array of objects by result of a method
# Solution (Example 2)
my @sorted2 = @product.sort(*.get_price);
for @sorted2 { .name.say };

say '-' x 45;
# Find minimum and maximum values from a list
my @temperatures = -3, 5, 7, 2, -1, -4, 0;
say "Minimum was " ~ @temperatures.min;
say "Maximum was " ~ @temperatures.max;

say "Cheapest: " ~ @product.min(*.get_price).name;
say "Costliest: " ~ @product.max(*.get_price).name;

# Stone,Scissor,Paper 石头剪刀布游戏
class Paper { }
class Scissor { }
class Stone { }
multi win(Paper,   Stone)   { "Win" }
multi win(Scissor, Paper)   { "Win" }
multi win(Stone,   Scissor) { "Win" }
multi win(::T,     T)       { "Draw" }
multi win(Any,     Any)     { "Lose" }

say win(Paper, Paper);
say win(Scissor, Stone);
say win(Stone, Scissor);

#Draw
#Lose
#Win 