my @names = <Patrick Jonathan Larry Moritz Audrey>;
say .key, "\t", ~.values
    for @names.classify( *.chars );
# 根据字符串的字符个数分类
# Output:
# 7	Patrick
# 8	Jonathan
# 5	Larry
# 6	Moritz Audrey
