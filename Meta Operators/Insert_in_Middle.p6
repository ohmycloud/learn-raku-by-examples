use v6;

# 该源文件必须保存为 UTF8 格式 才不会报 UTF-8 错误, 即使是中文注释

sub infix:<中>(@array, $ins) {
    @array.splice(+@array / 2, 0, $ins);
    return @array;
}

my @a = 1,2,4,5;
say @a 中 3;
