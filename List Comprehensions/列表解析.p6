## 生成 `1x1, 2x2, 3x3, ..., 10x10` 的列表：


($_**2 for 1..10);



# `for` 语句前面还可以添加 if 修饰符，这样我们就可以仅筛选出偶数的平方：

($_**2 if !($_ % 2) for 1..10)
($_**2 if $_ % 2 == 1 for 1..10) # 同上


# 组合多个 if 条件:


my @list = ($_ if $_ %2 == 1 && $_ > 2 for 1..6 )     # [3 5]   


# 还可以生成全排列：

($_ for "ABC".comb X~ "XYZ".comb) # ("AX", "AY", "AZ", "BX", "BY", "BZ", "CX", "CY", "CZ")

my @a = (1,3,4)                                                                       
my @b = (2,4,6)                                                                     
my @list = (@a X @b)    # 这儿也可以用圆括号, 也可以不用                                                      
# [(1 2) (1 4) (1 6) (3 2) (3 4) (3 6) (4 2) (4 4) (4 6)] 



($_ when /7$/ for 1..99)
# (7 17 27 37 47 57 67 77 87 97)


# 大小写转换：

my @a = <Hello World IBM Apple>;
(.lc for @a)                # hello world ibm apple


# 删除字符串末尾的空白：

my @freshfruit = ' banana', ' loganberry ', 'passion fruit ';
(.trim for @freshfruit)     # "banana" "loganberry" "passion fruit"


# 向量运算：

my @vec = 2,4,6;
(3*$_ for @vec)                     # 6 12 18
(3*$_ if $_ > 3 for @vec)   # 12 18
(3*$_ if $_ < 2 for @vec)   # ()


# 嵌套数组：

 perl6
my @vec = 2,4,6;
([$_, $_**2].perl for @vec)       # [2, 4] [4, 16] [6, 36]
([$_, $_**2].WHAT for @vec) # (Array) (Array) (Array)


# Parcel:

(($_, $_**2).perl for @vec)       # (2, 4) (4, 16) (6, 36)
(($_, $_**2).WHAT for @vec) # (Parcel) (Parcel) (Parcel)


# 多个列表之间的列表解析

my @vec1 = 2,4,6;
my @vec2 = 4,3,-9;
($_ for @vec1 X* @vec2)           # 8 6 -18 16 12 -36 24 18 -54
($_ for @vec1 X+ @vec2)           # 5 -7 8 7 -5 10 9 -3
($_ for @vec1 Z* @vec2)           # 8 12 -54
($_ for @vec1 >>*<< @vec2)        # 8 12 -54


使用列表解析处理矩阵:

 perl6
my @a = ([1,2,3], [4,5,6], [7,8,9]);
@a[0]                     # 1 2 3
@a[0][1]                  # 2
@a[0][2]                  # 3
($_[1] for @a)            # 2 5 8
($_[2] for @a)            # 3 6 9
($_[2]-1 for @a)          # 2 5 8
(@a[$_][$_] for 0..2)     # 1 5 9


# 矩阵转置

 perl6
sub transpose (@m) {
    @m[0].keys.map: {[ @m»[$_] ]};
}

my @a = [< a b c d e >],
        [< f g h i j >],
        [< k l m n o >],
        [< p q r s t >];

(.say for @a.&transpose);


 perl
a f k p
b g l q
c h m r
d i n s
e j o t


# 1到20之间哪些数字组成直角？

my $n = 20;
my @a = gather for 1..$n -> $x {
         for $x..$n -> $y {
           for $y..$n -> $z {
             take $x,$y,$z if $x*$x + $y*$y == $z*$z;
           }
         }
       };
say "@a[]";

# 3 4 5 5 12 13 6 8 10 8 15 17 9 12 15 12 16 20       
