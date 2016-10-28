# 问题： 你有 100 扇关着的门排成一排， 然后你穿过这些门 100 次。第一次穿过的时候，穿越每一扇门， 如果门是开着的就关闭它， 如果门是关着的就打开它。第二次穿越的时候，每两扇门穿越一下，（第 2、4、6扇门）；第三次穿越的时候， 每 3 扇门（第 3、6、9），等等， 直到你穿过第 100 扇门为止。
# 问： 最后一次穿过门之后， 每扇门的状态是开是关？
# 提示： 剩下开着的门就是那些能开方的整数the only doors that remain open are whose numbers are perfect squares of integers
#`(
my @doors = False xx 101;
 
($_ = !$_ for @doors[0, * + $_ ...^ * > 100]) for 1..100;
 
say "Door $_ is ", <closed open>[ @doors[$_] ] for 1..100;
)

say "Door $_ is open" for map {$^n ** 2}, 1..10;

say "Door $_ is open" for 1..10 X** 2;

say "Door $_ is ", <closed open>[.sqrt == .sqrt.floor] for 1..100;

# « U+00AB  , » U+00BB  Vim => Ctrl+V => u => 00AB

