my @array = 1,3,5,7,9;

my @arrayplus3 = map( *+3, @array);
say @arrayplus3;

my @arrayplusab = map( *+*+3, @array,11);
say @arrayplusab;
