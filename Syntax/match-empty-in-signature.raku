multi sub foo ($_){.say}
multi sub foo (Empty){ say 'Hello, World' }

# 以下代码都打印 'hello world'
foo Empty;
foo (1 if 0);
foo (1 if Flase);
foo (|());
foo (|[]);
foo (|{});
foo (1 with Nil);
foo (Nil andthen 1);