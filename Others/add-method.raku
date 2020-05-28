Int.^add_method('power', method (Int $num) returns Int:D {
     return self ** $num;
});

2.power(3).say;  # 8
2.power(10).say; # 1024