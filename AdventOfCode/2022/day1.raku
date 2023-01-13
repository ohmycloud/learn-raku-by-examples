#| 计算哪个精灵携带的卡路里最多
#| https://adventofcode.com/2022/day/1
grammar Calories {
    token TOP     { <Elf>+ %% \n       }
    token Elf     { <calorie>+ %% \n   }
    token calorie { \d+                }
}

class CaloriesAction {
    method TOP($/) {
        make $/<Elf>».made;
    }
    method Elf($/) {
        make [+] $/<calorie>;
    }
    method calorie($/) {
        make $/.Int;
    }
}

my $parse = Calories.parse($=finish, :actions(CaloriesAction));
say $parse.made.max;

=finish
1000
2000
3000

4000

5000
6000

7000
8000
9000

10000