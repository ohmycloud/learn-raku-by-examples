class Employee {
    has $.salary is rw = 1000 ;
    has %.hash is rw = 'Perl' => 5, 'Takudo' => 6;

    method pay() {
        say "Here is \$$.salary";
    }
}

class Programmer is Employee {
    has @.known_languages is rw;
    has $.favorite_editor;

    method code_to_solve( $problem ) {
        $.salary = 100;
        %.hash{'ha'} = 'haha';
        say %.hash{'ha'};
        say "Solving $problem using $.favorite_editor in "
        ~ $.known_languages[0] ~ '.' ~ ' with slary ' ~ $.salary;
    }
}

my $programmer = Programmer.new(
    salary => 100_000,
    known_languages => <Perl5 Perl6 Erlang C++>,
    favorite_editor => 'vim'
);

$programmer.code_to_solve('halting problem');
$programmer.pay();
