class Student {
    has Str $.name;
    has Int $.grade is rw;
}

my $stu1 = Student.new(name => "zhangwuji", grade => 124);
my $stu2 = Student.new(name => "yangguo",   grade => 128);     
my $stu3 = Student.new(name => "zhaomin",   grade => 145);
my $stu4 = Student.new(name => "sunyizhe",  grade => 145);
my $stu5 = Student.new(name => "zhouziruo", grade => 128);
my $stu6 = Student.new(name => "qiaofeng",  grade => 124);

my @students = $stu1, $stu2,$stu3,$stu4,$stu5,$stu6;

# classify 
# classify 返回一个散列
for @students.classify( *.grade ).sort -> $group {
    say "These students got grade $group.key():";
    say .name for $group.value.list;
}


# sort
my @c = @students.sort: -> $a, $b {$a.grade <=> $b.grade};
say @c.perl;