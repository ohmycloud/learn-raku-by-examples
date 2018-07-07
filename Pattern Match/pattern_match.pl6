# 使用签名进行模式匹配

class Body   { has ( $.head, @.arms, @.legs ) }
class Person { has ( $.mom,  $.body, $.age  ) }

my $age = 42;
multi person's-age-and-legs ( Person ( :$age where * > 40, :$body ( :@legs, *% ), *% ) ) { say "$age {+@legs}" }
person's-age-and-legs Person.new(:$age,body => Body.new(:head,:2arms,legs => <left middle right>)); # 42 3
