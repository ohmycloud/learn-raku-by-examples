#!/usr/bin/env perl6

say “啊啊啊”;
say '“'.uniname; # LEFT DOUBLE QUOTATION MARK
say '“'.ord;     # 8220
say 8220.chr;    # “

say so '“' ~~ /<:Han>/; # False

say "‘".uniname; # LEFT SINGLE QUOTATION MARK
say "‘".ord;     # 8216
say 8216.chr;    # ‘