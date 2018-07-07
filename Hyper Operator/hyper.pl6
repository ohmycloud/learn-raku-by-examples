use v6;

# 生成 A1a, B1b...A2a...E2e 这样的字符串
my @prefixes  = 'A'..'E';  # 前缀
my @roots     = 1, 2;      # 根
my @postfixes = 'a'..'e';  # 后缀

say @roots.map: |(@prefixes »~» * «~« @postfixes);

# Output: (A1a B1b C1c D1d E1e A2a B2b C2c D2d E2e)
# Create a WhateverCode for metaopping concatenation,
# slipping the result to get a Seq with only scalar values at the end
