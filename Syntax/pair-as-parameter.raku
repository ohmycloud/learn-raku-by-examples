my $pair1 = Pair.new('hours', 5); dd $pair1; # Pair $pair1 = :hours(5)
my $pair2 = :5hours; dd $pair2;              # Pair $pair2 = :hours(5)
my $pair3 = hours => 5; dd $pair3;           # Pair $pair3 = :hours(5)
my $pair4 = 'hours' => 5; dd $pair4;         # Pair $pair4 = :hours(5)

say $pair1 === $pair2 === $pair3 === $pair4; # True
say $pair1 eqv $pair2 eqv $pair3 eqv $pair4; # True

sub colon-pair(:$hours ) {
    say $hours;
}

my $hours = 5;

colon-pair( :$hours );
colon-pair( hours => $hours );

# 为什么这里必须使用 slip 运算符?
colon-pair(|$pair1);
colon-pair(|$pair1);
colon-pair(|$pair2);
colon-pair(|$pair3);
colon-pair(|$pair4);

# why `Slip` is not the same as `|` above
colon-pair($pair1.Slip); # Too many positionals passed; expected 0 arguments but got 1
colon-pair($pair2.Slip); # Too many positionals passed; expected 0 arguments but got 1
colon-pair($pair3.Slip); # Too many positionals passed; expected 0 arguments but got 1
colon-pair($pair4.Slip); # Too many positionals passed; expected 0 arguments but got 1

# `|` 解决了什么问题? 参考如下链接。
# https://stackoverflow.com/questions/71107294/why-cant-pass-a-manually-created-pair-to-method-without-a-slip