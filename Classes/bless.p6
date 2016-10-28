class Human {
  has $.name;
  has $.age;
  has $.sex;
  has $.nationality;
  has $.eligible;
  method assess-eligibility {
      if self.age < 21 {
        $!eligible = 'No'
    } else {
        $!eligible = 'Yes'
      }
  }

}

my $john = Human.new(name => 'John', age => 23, sex => 'M', nationality => 'American');
$john.assess-eligibility;
say $john.eligible;

my $name="czq";
my $human = Human.new(:$name);
say $human.name;


class Point {
    has $.x;
    has $.y;

    # multi 是可选的
    multi method new($x, $y) {
        self.bless(:$x, :$y);
    }
}

# 重写构造函数后, 不需要传具名参数了
my $p = Point.new(-1, 1);
say $p.x;
