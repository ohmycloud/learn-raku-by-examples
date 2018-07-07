subset Seconds of Numeric;

my %unit-multipliers = 'd'|'day' => 60*60*24, 'h'|'hour' => 60*60, 'm'|'min' => 60, 's'|'sec' => 1; 
my @units = %unit-multipliers.keys;

my regex number { \d+ [ '.' \d+ ]? }
my regex suffix { @units }

# @timicles => [0.5m 10s 0.5min, 10sec 1day 1d]
sub MAIN(*@timicles where .all ~~ /<number> @units $/) {
    my Seconds $to-wait = @timicles»\
        .match(/<number> <suffix> $/)».hash
        .map(-> % ( :$number, :$suffix ) { %unit-multipliers{$suffix} * $number })\
        .sum;
    say $to-wait ~ "s";
}

# Usage: perl6 program.pl6 0.5m 10s 0.5min 10sec 1day 1d