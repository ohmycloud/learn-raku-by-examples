@list.grep(* > 10)                  # 返回 @list 数组中所有大于 10 的元素
@list.grep( -> $ele { $ele > 10 } ) # 同上, 使用显式的闭包
@list.grep: -> $ele { $ele > 10 }   # 同上, 使用冒号调用方式
@list.grep: * > 10                  # 同上
@list.grep: { $_ > 10 }             # 同上


@list.map(* + *)                    # 返回 @list 数组中每两个元素的和
@list.map( -> $a, $b { $a+$b } )    # 同上, 使用显式的闭包