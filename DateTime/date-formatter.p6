#!/usr/bin/env perl6

my $fmt =  { sprintf "%04d%02d%02d", .year, .month, .day };
.say for Date.new('2019-01-27', formatter => $fmt) .. Date.new('2019-01-31', formatter => $fmt);

#20190127
#20190128
#20190129
#20190130
#20190131