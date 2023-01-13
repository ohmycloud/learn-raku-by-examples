say <a A B b c b C>.unique( as => &lc).raku;

my @list = %(a => 42), %(b => 13), %(a => 42);
say @list.unique(:with(&[eqv]))           # OUTPUT: «({a => 42} {b => 13})␤»