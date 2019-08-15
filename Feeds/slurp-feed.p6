my @a =slurp('Hamlet.txt').comb(/\w+/);
my @result = (@a ==> sort *.chars ==>  reverse @() ==> join "\n");
say  @result; # @() 不使用临时数组存储中间变量