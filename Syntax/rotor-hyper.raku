my $list = [1,2,3,4,5,6,7,8,9,10,11,12];
my @res = gather for $list.rotor(3).kv -> $idx, $value {take |$value >>~>> ('_' ~ ($idx + 1)) }
say @res;