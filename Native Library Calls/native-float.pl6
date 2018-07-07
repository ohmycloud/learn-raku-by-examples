#!/usr/bin/env perl6

use NativeCall;


my uint32 $num = .new;
my num32 $float = .new: Num(1.0);

sub memcpy(num32 $float, uint32 $num, int32 $size) is native('Str') { * };

memcpy($float,$num,4);
say $num;
