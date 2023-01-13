sub positional_and_named_parameter(*@_, *%_) {
    dd @_, %_;
    say '-' x 22;
}

my $p1 = Pair.new('hours', 5);
my $p2 = :5hour;
my $p3 = hour => 5;
my $p4 = 'hour' => 5;

#| Array element = []
#| Hash element = {}
positional_and_named_parameter;


#| Array element = []
#| Hash element = {:hour(5)}
positional_and_named_parameter |$p1;
positional_and_named_parameter |$p2;
positional_and_named_parameter |$p3;
positional_and_named_parameter |$p4;


#| Array element = []
#| Hash element = {:hours(20)}
positional_and_named_parameter :20hours;


#| Array element = ["this positional is before named parameter"]
#| Hash element = {:hours(20)}
positional_and_named_parameter 'this positional is before named parameter', :20hours;


#| Array element = ["this positional is after named parameter"]
#| Hash element = {:hours(20)}
positional_and_named_parameter :20hours, 'this positional is after named parameter';


#| Array element = ["this positional is between two named parameter"]
#| Hash element = {:hours(20), :years(5)}
positional_and_named_parameter :20hours, 'this positional is between two named parameter', :5years;


#| Array element = ["this positional is after two named parameter"]
#| Hash element = {:hours(20), :years(5)}
positional_and_named_parameter :20hours, :5years, 'this positional is after two named parameter';