use v6;
use Test;

{

    my @data = <1 2 4 5 7 8>;
    my @odds = <1 5 7>;

    eval_dies_ok('@data <== grep {$_ % 2} <== @data', 'a chain of feeds may not begin and end with the same array');

    @data = <1 2 4 5 7 8>;
    @data <== grep {$_ % 2} <== eager @data;
    # rakudo 2 todo 'feeds + eager'
    is(~@data, ~@odds, '@arr <== grep <== eager @arr works');

    @data = <1 2 4 5 7 8>;
    @data <== eager grep {$_ % 2} <== @data;
    is(~@data, ~@odds, '@arr <== eager grep <== @arr works');
}
