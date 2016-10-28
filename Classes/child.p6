class Parent {
    method frob {
        say "the parent class frobs"
    }
}

class Child is Parent {
    method frob {
        say "the child's somewhat more fancy frob is called"
    }
}
# 对象的实际类型决定了要调用哪个方法
my Parent $test;
$test = Child.new;
$test.frob;          # calls the frob method of Child rather than Parent
