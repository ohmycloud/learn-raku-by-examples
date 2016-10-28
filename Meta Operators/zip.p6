use v6;
my @a=1,2,3;
my @b=4,5,6;
my @c=7,8,9;
for zip(@a; @b; @c) -> $a, $b, $c {say $a,$b,$c;}

# 多行注释
my $things = #`( i wonder how many of these
 I will need, hm maybe 3, or 4, better 5 ) 5; # same as $things = 5;
say $things;

say Q/hello/;
say Q{world};
say Q|1234|;
say Q,comma,;
say Q[maohao];
say Q*askiles*;
say Q:a/@a[0]/;  # 1
say @a[1];

