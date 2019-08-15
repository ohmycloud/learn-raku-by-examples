use v6;

# Be careful about using type constraints on arrays and hashes. The type constraints the elements.
# 在对数组和散列使用类型限制时要小心. 类型限制的是元素!

sub total(Array @distances) { # 限制数组 @distances 中的每个元素为数组.
    # WRONG! Takes an Array of Arrays!
}

sub total(Int @distances) {
    # Correct, takes an array of Ints.
}