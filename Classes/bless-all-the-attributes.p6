use v6;

# bless 的原理
class Dog {
    has $.name;
    my $.counter; # 类方法
    # 重写 new 方法, 使用位置参数创建实例
    method new ($newName) {
        $.counter++;
        self.bless(name => $newName);
    }
}

my $dog = Dog.new("yayaya");
say $dog.name;
say Dog.counter;
