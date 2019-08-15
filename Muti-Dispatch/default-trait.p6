multi foo(Int $x) { 1 }
multi foo(Int $x) is default { 2 }
say foo(1); # 2
