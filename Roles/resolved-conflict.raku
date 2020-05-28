role Sleeping {
    method lie {
        say "Reclining horizontally...";
    }
}

role Lying {
    method lie {
        say "Telling an untruth...";
    }
}

# 如果解决方法同名的冲突呢？
# 在 class 中定义一个同名的方法即可
class SleepingLiar does Sleeping does Lying {
    method lie {
        say "Lying in my sleep....";
    }
}

my $sleep = SleepingLiar.new;
$sleep.lie; # Lying in my sleep....

# 调用其中之一的 roles 的 lie 方法
class SleepingSheep does Sleeping does Lying {
    method lie {
        self.Sleeping::lie;
    }
}

my $sleepSheep = SleepingSheep.new;
$sleepSheep.lie; # Reclining horizontally...
