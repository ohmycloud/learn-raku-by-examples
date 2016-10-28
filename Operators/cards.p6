my @suits  = <♣ ♢ ♡ ♠>;
my @ranks  = 2..10, <J Q K A>;

# concatenate each rank with each suit (2♣ 2♢ 2♡ ... A♠)
my @deck = @ranks X~ @suits;

# build a hash of card names to point values
# 52 张牌， 4 种花色， A 的值为 11 ， J、Q、K 为 10
my %points = @deck Z @( (2..10, 10, 10, 10, 11) Xxx 4 );

# 把牌打乱
@deck .= pick(*); # shuffle the deck
my @hand = @deck.splice(0, 5); # 抓取前 5 张牌
say ~@hand; #  显示抓取的是哪 5 张
say [+] %points{@hand}; # 这 5 张牌面的值加起来是多少
