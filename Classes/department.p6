class Department {
    has @.employees;
    has $.name;

    method gen_print_info {
        return “$.name:\n” ~ “\t\t” ~ @.employees.sort.join(“, ”)
    }
}

my @company = (
    Department.new(name      => ‘Accounting’,
                  employees  => <Jeff Jane Susan>),
    Department.new(name      => ‘Security’,
                  employees  => <Alice Bob>),
    Department.new(name      => ‘Marketing’,
                  employees  => <Margaret Terry Lawrence>),
    Department.new(name      => ‘Development’,
                  employees  => <Matt Fred Steve Joe Alith Jie>)
);

my @print_info = @company>>.gen_print_info;
.say for @print_info;