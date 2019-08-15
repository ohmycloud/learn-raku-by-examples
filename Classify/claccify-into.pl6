my @list = (
    <Camelia 5>,
    <Camelia 6>,
    <Camelia 7>,
    <Amelia 1>,
    <Amelia 2>,
    <Amelia 3>
    );

my %hash = @list.classify: *.[0], as => *.[1];
say %hash;  # {Amelia => [1 2 3], Camelia => [5 6 7]}
@list.classify: *.[0], :into(my %h), :as( *.[1] );
say %h;
