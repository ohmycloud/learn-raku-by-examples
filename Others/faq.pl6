# Scalar Container
# 标量容器 

my $x = 42;
say $x;

# 赋值语句存储了一个指向Int对象42的指针到标量容器里。
# 赋值操作符要求左边去存储右边表达式的值到左侧的容器中.
# 标量的意思是"用新值替换之前存储的值"

sub f($a is rw) {
	$a = 23;
}
my $x = 42;
f($x);
say $x; # OUTPUT: 23

# 在子程序内部,$a变量与子程序外部的$x变量指向同一个容器,
# 所以给$a赋值也就同时修改了$x的值
# 如果子程序被标记成 is rw 那么它也同样能返回一个容器
# 看下面的例子

my $x = 23;
sub f() is rw { $x };
f() = 42;
say $x; # OUTPUT: 42

# is rw 属性访问器就是这么工作的,它返回一个容器
# 所以 

class A {
	has $.attr is rw;
}

# 等同于

class A {
	has $!attr;
	method attr() is rw { $!attr }
}

# 这就完成了$att的'可写'访问器

# 标量容器被转给上层类型检查并且大部分都是只读的.
# 使用.VAR能让容器可见

my $x = 42;
say $x.^name; # OUTPUT: Int;
say $x.VAR.^name; # OUTPUT: Scalar

# 当参数是is rw时,需要给这个参数提供一个可写的标量容器，
# 也就是一个pointer指针变量

sub f($x is rw) {
	say  $x;
}
f 42; # 报错，这里参数应该是一个可写标量，42是只读类型

my $b = 42;
f $b; # OUTPUT: 42

# 可调用容器
# Callable Container

my &callable = -> $r { say "$r is ", $r ~~ Int??" Whole"!!" Not Whole"; }
callable(1/3);
callable( 3 );

sub f() {}
my &g =sub {}
sub caller(&c1, &c2) {c1, c2}
caller(&f, &g);

# Binding
# 绑定，绑定操作符是 := 
# 可以绑定一个值或者容器给左侧的变量

my $x := 42;

# 一旦绑定到Int对象42上，$x的值就会与42的值保持一致
# 由于42是一个只读类型，所以$x无法接受新的赋值

$x = 23 ; # 这里将会报错

# 也可以把一个变量绑定到另一个变量上

my $a = 0 ;
my $b = 0;
$a := $b;
$b = 42;
say $a; #OUTPUT: 42

# 无标识符变量和参数使用原型 is raw 总是绑定(无论是= 还是 :=)


my $a = 42;
my \b = $a;
b++;

say $a; # OUTPUT: 43

sub f($c is raw) { $c++ }
f($a);
say $a; # OUTPUT: 44

# 标量容器与列表
# 在perl6中有很多不同语义的基于位置的容器类型
# 最基本的就是List,它由 , 号分隔

say (1, 2, 3).^name; # OUTPUT: List

# List是不可变的,这意味着你不能改变列表里的元素数目
# 但如果其中一个元素正好是标量容器,你就可以对它赋值

my $x = 42;
($x, 2, 3)[0] = 23;
say $x; # OUTPUT: 23
($x, 1, 2)[1] = 23; # Cannot modify an immutable value
CATCH { default { say .^name, ': ', .Str } };
# OUTPUT: <<X::Assignment::RO: Cannot modify an immutable Int>>

# Array很像List,除了它强制每个元素都必须是容器
# 这就是说你总是可以对一个元素赋值

my @a = 1, 2, 3;
@a[0] = 42;
say @a; # OUTPUT: [42 2 3]

# 对Array变量赋值和绑定
# 对一个标量变量赋值和对一个数组变量赋值是一样的
# 取消原有值,放入一个新值

my $x = 42; say $x.^name; # OUTPUT: Int
my @a = 42;say @a.^name; # OUTPUT: Array

# 结果不同是因为Scalar容器类型可以隐藏自己
# 而给一个数组变量赋一个非数组类型的值时会
# 发生强制转换.非数组值会变成数组类型

# 绑定一个非数组值到数组变量是可行的

my @a := (1, 2, 3);
say @a.^name; # OUTPUT: List

# 绑定到数组元素
# 奇怪的是,perl6支持绑定到数组元素

my @a = (1, 2, 3);
@a[0] := my $x;
$x = 42;
say @a; # OUTPUT: [42 2 3]

# 注意,因当避免直接绑定非容器到数组元素上
# 这会对之后数组的使用造成与预期相反的结果

my @a = (1, 2, 3);
@a[0] := 42; # 不推荐，应该用赋值
my $b := 42;
@a[1] = $b; # 不要这样
@a[2] = $b; # 但是这样可以
@a[1, 2] = 1, 2; # 运行时错误
CATCH { default { say .^name, ": ", .Str } }
# OUTPUT: X::Bind::Slice: Cannot bind to Array slice


# 平展、条目和容器
# % @ 标示符在perl6中通常指向多个值的
# 迭代结构，而 $ 表示单个值

my @a = 1, 2, 3;
for @a {}; # 3次迭代
my $a = (1, 2, 3);
for $a {}; # 1次迭代

# @标示的变量在列表上下文中不会被展平

my @a = 1, 2, 3;
my @b = @a, 4, 5;
say @b.elems; # OUTPUT: 3

my @a = 1, 2, 3;
say (flat @a, 4, 5).elems; # OUTPUT: 5

sub f(*@x) { @x.elems };
say f @a, 4, 5; # OUTPUT: 5

# 以上,标量容器会阻止平展化

sub f(*@x) { @x.elems};
my @a = 1, 2, 3;
say f $@a, 4, 5; # OUTPUT: 3

# @ 符号也可以作为前缀，
# 来强制转换参数为一个列表

my $x = (1, 2, 3);
.say for @$x; # 3 迭代

# 但是 <> 比列表更适合拆解容器内元素

my $x = ^Inf .grep: *.is-prime;

# 错误！列表保持值，会因此造成内存泄漏
say "$_ is prime" for @$x;

# 正确！
say "$_ is prime" for $x<>; 

# 更好！没有用标量
my $y := ^Inf .grep: *.is-prime;

# 方法通常不在乎是否在标量内被调用

my $x = (1, 2, 3);
$x.map(*.say); # 3 迭代

# 自引用数据

my @a;
@a[0] = @a;
put @a.perl;

# 类型约束

my Int \z = 42;
z := 100; # OK
z := "x"; # 类型检查失败

my Str $x;
say $x.VAR.of; # OUTPUT: (Str)
my Num @a;
say @a.VAR.of; # OUTPUT: (Num)
my Int %h;
say %h.VAR.of; # OUTPUT: (Int)

# 自定义容器

sub lucky(::T $type) {
    my T $c-value;
    return Proxy.new(
	FETCH => method () { $c-value},
	STORE => method (T $new-value) {
	    X::OutOfRange.new(what=>'number', got=>'13',
			      range=> '-∞..12,14..∞').throw if $new-value == 13;
	    $c-value = $new-value;
	}
    );
}
my Int $a := lucky(Int);
say $a = 12;
say $a = 'FOO';
say $a = 13;
CATCH { default {say .^name, ": ", .Str} }
