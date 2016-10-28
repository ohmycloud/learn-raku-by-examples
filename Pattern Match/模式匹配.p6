### 模式匹配

my $name = "twostraws";

given $name {
  when "bilbo"      { say "Hello, Bilbo Baggins!"}
  when "twostraws"  { say "Hello, Paul Hudson!"  }
  default           { say "身份验证失败"           }
}



### 同时检查名字和密码

my $name     = "twostraws";
my $password = "fr0st1es";

given ($name, $password) {
  when ("bilbo", "bagg1n5")      { say "Hello, Bilbo Baggins!" }
  when ("twostraws", "fr0st1es") { say "Hello, Paul Hudson!"   }
  default                        { say "你是谁?"                }
}



### 使用单个元组

my $authentication = ("twostraws", "fr0st1es");

given $authentication {
  when ("bilbo", "bagg1n5")      { say "Hello, Bilbo Baggins!" }
  when ("twostraws", "fr0st1es") { say "Hello, Paul Hudson!"   }
  default                        { say "你是谁?"                }
}



### 部分匹配

# 你只关心某些感兴趣的值，不关心其它值，使用 `*` 号或 `$` 来代表 "any value is fine"
my $authentication = ("twostraws", "fr0st1es", "127.0.0.1");
given $authentication {
  when ("bilbo", "bagg1n5", *)      { say "Hello, Bilbo Baggins!"}
  when ("twostraws", "fr0st1es", $) { say "Hello, Paul Hudson!"  }
  default                           { say "Who are you?"         }
}



### 只匹配元组的一部分

# 但仍然想知道其它部分是什么
my $authentication = ("twostraws", "fr0st1es");
given $authentication {
  when ("bilbo", *)     { say "Hello, Bilbo Baggins!" }
  when ("twostraws", *) { say "Hello, Paul Hudson: your password was $_!" }
  default               { say "Who are you?"         }
}



### 匹配计算型元组

sub fizzbuzz(Int $number) returns Str {
    given ($number % 3 == 0, $number % 5 == 0) {
      when (True, False)  { return "Fizz"     }
      when (False, True)  { return "Buzz"     }
      when (True, True)   { return "FizzBuzz" }
      when (False, False) { return $number.Str}
    }
}

say fizzbuzz(15);



### 遍历元组

my $twostraws = ("twostraws", "fr0st1es");
my $bilbo = ("bilbo", "bagg1n5");
my $taylor = ("taylor", "fr0st1es");
my @users = $twostraws, $bilbo, $taylor;

for @users -> $user {
    say $user[0];
}


### 使用 when 匹配元组中的指定值

my $twostraws = ("twostraws", "fr0st1es");
my $bilbo = ("bilbo", "bagg1n5");
my $taylor = ("taylor", "fr0st1es");
my @users = $twostraws, $bilbo, $taylor;

say "User twostraws has the password fr0st1es" when ("twostraws", "fr0st1es") for @users;

# 打印密码为指定值的用户
say "User $_[0] has password \"fr0st1es\"" when (*, "fr0st1es") for @users;



### 匹配范围

my $age = 36;

given $age {
  when 0 ..^ 18   { say "你有活力有时间，但是没钱"  }
  when 18 ..^ 70  { say "你有活力有钱，但是没时间"  }
  default         { say "你有时间和金钱，但是没活力"}
}



### when 可以配合智能匹配操作符 ~~ 单独使用

my $age = 36;
when $age ~~ 0 ..^ 18  { say "你有活力有时间，但是没钱"  } 
when $age ~~ 18 ..^ 70 { say "你有活力有钱，但是没时间"  }
default                { say "你有时间和金钱，但是没活力"}


### 使用 contains 方法

my $age = 36;
when (0 ..^ 18).contains($age)  { say "你有活力有时间，但是没钱"  } 
when (18 ..^ 70).contains($age) { say "你有活力有钱，但是没时间"  }
default                         { say "你有时间和金钱，但是没活力"}


### 匹配元组中的范围

my $user = ("twostraws", "fr0st1es", 36);
given $user {
  my $name = $user[0];
  when ($name, *, 0 ..^ 18)  { say "$name 有活力有时间，但是没钱"  } 
  when ($name, *, 18 ..^ 70) { say "$name 有活力有钱，但是没时间"  }
  when ($name, *, *)         { say "$name 有时间和金钱,但是没活力" }
}



### 枚举

enum WeatherType <Cloudy Sunny Windy>;
my $today = WeatherType::Cloudy;
given $today {
  when WeatherType::Cloudy { say "多云" }
  when WeatherType::Sunny  { say "晴天" }
  when WeatherType::Windy  { say "有风" }
}

# 使用 if 语句
if $today ~~ WeatherType::Cloudy { say "多云" }



### 关联值

enum WeatherType  (
    Cloudy => 100,
    Sunny  => 50,
    Windy  => 30
);

my $today = WeatherType::Windy;
given $today {
  when WeatherType::Cloudy { say 20*Cloudy }
  when WeatherType::Sunny  { say 10*Sunny  } 
  when WeatherType::Windy  { say 12*Windy  }
}



### when 从句

my @numbers = 1..10;
.say when $_ % 2 == 1 for @numbers;

my @celebrities = "Michael Jackson", "Taylor Swift", "MichaelCaine", "Adele Adkins", "Michael Jordan";
.say when /^Michael/ for @celebrities;     # 使用正则表达式
.say when $_.chars > 12 for @celebrities;  # 调用方法
.say when /^Michael/ and $_.chars >12 for @celebrities; # 复合条件
