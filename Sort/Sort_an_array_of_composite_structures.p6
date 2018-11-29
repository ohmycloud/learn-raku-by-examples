# Sort an array of composite structures by a key. For example, if you define a composite structure that presents a name-value pair (in pseudocode): 
# Define structure pair such that:
   # name as a string
   # value as a string


# and an array of such pairs:
# x: array of pairs


# then define a sort routine that sorts the array x by the key name.

# This task can always be accomplished with Sorting Using a Custom Comparator. If your language is not listed here, please see the other article.

# Works with: Rakudo Star version 2010.08

my class Employee {
   has Str $.name;
   has Rat $.wage;
}

my $boss     = Employee.new( name => "Frank Myers"     , wage => 6755.85 );
my $driver   = Employee.new( name => "Aaron Fast"      , wage => 2530.40 );
my $worker   = Employee.new( name => "John Dude"       , wage => 2200.00 );
my $salesman = Employee.new( name => "Frank Mileeater" , wage => 4590.12 );

my @team = $boss, $driver, $worker, $salesman;

my @orderedByName = @team.sort( *.name )>>.name;
my @orderedByWage = @team.sort( *.wage )>>.name;

say "Team ordered by name (ascending order):";
say @orderedByName.join('  ');
say "Team ordered by wage (ascending order):";
say @orderedByWage.join('  ');

# this produces the following output:
# Team ordered by name (ascending order):
# Aaron Fast   Frank Mileeater   Frank Myers   John Dude
# Team ordered by wage (ascending order):
# John Dude   Aaron Fast   Frank Mileeater   Frank Myers


# Note that when the sort receives a unary function, it automatically generates an appropriate comparison function based on the type of the data.

say "--" x 23;
say @team.sort({.wage} )>>.name;

.name.say for @team.sort: {.wage} #>>.name;