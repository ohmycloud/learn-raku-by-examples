use v6;

# 取出上一个月的所有周的 周一和周日 对应的 日期， 即上个月的自然周
enum DoW < Sunday Monday Tuesday Wednesday Thursday Friday Saturday >;

# 所有周六
# say (Date.new("2018-01-01")..Date.new("2018-12-31")).grep( *.day-of-week == Saturday );

# 所有周日
say (Date.new("2018-01-01")..Date.new("2018-12-31")).grep( *.day-of-week == (Sunday + 7) );
