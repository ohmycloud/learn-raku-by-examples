use v6;

my @lines = "/Users/ohmyfish/Desktop/redis_qr.txt".IO.lines;

.say for @lines.classify: {.split('_')[0..2].join("_")};