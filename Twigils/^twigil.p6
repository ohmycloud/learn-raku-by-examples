# ^ twigil 为block 块 或 子例程 申明了一个形式位置参数. 
# 形如 $^variable 的变量是一种占位变量. 它们可用在裸代码块中来申明代码块的形式参数. 看下面代码中的块: 

for ^4 {
    say "$^seconds follows $^first";
}

# 1 follows 0
# 3 follows 2
