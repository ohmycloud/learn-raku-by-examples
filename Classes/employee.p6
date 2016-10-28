class Employee {
    subset Salary         of Real where * > 0;
    subset NonEmptyString of Str  where * ~~ /\S/; 

    has NonEmptyString $.name    is rw;
    has NonEmptyString $.surname is rw;
    has Salary         $.salary  is rw;

    method gist {
        return qq:to[END];
        Name:    {$.name}
        Surname: {$.surname}
        Salary:  {$.salary}
        END
    }
}
my $employee = Employee.new();

given $employee {
    .name    = 'Sally';
    .surname = 'Ride';
    .salary  = 200;
}

say $employee;