use v6;

sub all-dimensions (% (:length(:$x), :width(:$y), :depth(:$z))) {
    sx andthen $y andthen $z andthen True
}

# andthen 返回第一个未定义的值, 否则返回最后一个元素。短路操作符。
# andthen 左侧的结果被绑定给 $_ 用于右侧, 或者作为参数传递, 如果右侧是一个 block 或 pointy block 的话。
