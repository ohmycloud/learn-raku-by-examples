use v6;

# Can use multiple dispatch with constraints to do a lot of "write what you know" style solutions

# Factorial:
# fact(0) = 1
# fact(n) = n * fact(n - 1)

multi fact(0)  { 1 };
multi fact($n) { $n * fact($n - 1) };

say fact(10);


# Fibonacci Sequence:
# fib(0) = 0
# fib(1) = 1
# fib(n) = fib(n - 1) + fib(n - 2)

# mutil 声明的子例程语句结尾不需要跟分号;
multi fib(0)  { 0 }
multi fib(1)  { 1 }
multi fib($n) { fib($n - 1) + fib($n - 2) }

say fib(10);