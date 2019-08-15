# Perl 6 中的 ::?CLASS:U:

```
class Dog { method legs { 4 } }               # class method
class Dog { method legs (Dog:) { 4 } }        # same
class Dog { method legs (::?CLASS:) { 4 } }   # same

class Dog { method legs (Dog:U:) { 4 } }      # only accepts an undefined dog

class Dog { method legs (::?CLASS:U:) { 4 } } # only accepts an undefined Dog
class Cat { method legs (::?CLASS:U:) { 4 } } # only accepts an undefined Cat
```

`::?CLASS:U:` 是一种使用闭合类的动态查询的类型约束.
