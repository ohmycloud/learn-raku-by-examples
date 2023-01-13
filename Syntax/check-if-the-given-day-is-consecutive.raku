my @dates = gather .Str.take for Date.new('2019-09-01') ... Date.new('2020-09-23');
my @current = gather .Str.comb(/\d**4'-'\d**2'-'\d**2/)[0].take for $=finish.lines;

say @dates (-) (@current);

=finish
day=2019-09-01
day=2019-09-02
day=2019-09-03
day=2019-09-04
day=2019-09-05