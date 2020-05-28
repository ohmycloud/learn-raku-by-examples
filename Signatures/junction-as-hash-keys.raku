subset Seconds of Numeric;
my regex number { \d+ [ '.' \d+ ]? } # float 
my regex suffix { <[dhms]> }

my %unit-multipliers = 'd' => 60*60*24, 'h' => 60*60, 'm' => 60, 's' => 1; # 每天, 每小时, 每分钟, 每秒所对应的秒数

# @timicles => [0.5m 10s]
sub MAIN(*@timicles where .all ~~ /<number> <[dhms]>/) {
    my Seconds $to-wait = @timicles»\
        .match(/<number> <suffix>+/)».hash\ # the +-quatifier is a workaround
        .map(-> % ( Rat(Any) :$number, Str(Any) :$suffix ) {say $suffix; %unit-multipliers{$suffix} * $number })\
        .sum;
    say $to-wait ~ "s";
}