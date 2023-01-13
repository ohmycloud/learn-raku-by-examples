#!/usr/bin/env perl6

#| https://stackoverflow.com/questions/38816496/override-attribute-of-a-role
#`<
{
    role A {
        has $.a;
    }
    class B does A {
        # Opps, Attribute '$!a' already exists in the class 'B', but a role also wishes to compose it
        #has $.a = "default"; # uncomment this line will lead to compile error
    }
    my $b = B.new;
}
>

#| Use the submethod BUILD to initialise inherited/mixedin attributes.
{
    role A {
        has $.a is rw;
    }

    class B does A {
        submethod BUILD { $!a = "default" }
    }

    my $b = B.new;
    dd $b;

    my $bb = B.new(:a("来自于初始化"));
    say $bb; # 结果依然是 B.new(a => "default")
}
