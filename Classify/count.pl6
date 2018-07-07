my $a = ('a' .. 'z').roll(1000000);
say .key, ' => ', .value for $a.cache.classify(*.Str).map({.key => .value.elems}).sort({-.value});
say now - INIT now;