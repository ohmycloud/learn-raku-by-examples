#!env raku

my %weight-usage = (
    a => 100,
    b => 120.1,
    c => 240.5,
    d => 445.7,
);

sub MAIN (
    Num() $total-weight,
    Int() :$max-amount = 100,
) {
    my @allowed-weight = 'a' .. 'c';
    my @allowed-combs = @allowed-weight.map({
        my $max-plots = Int($total-weight / %weight-usage{$_});
        my $size = %weight-usage{$_};
        (0 .. $max-plots).map({ $(($size xx $_).List) });
    });
    my @all-combos = cross(@allowed-combs.map(*.flat));
    my %result = @all-combos.hyper.map({
        my @combo = $_[];
        my $k = @combo[]:p.map({ "{.key}={.value.List.elems}" }).join(',');
        my $sum = @combo.map(|*).sum;
        ($k => $sum);
    });
    dd %result;
}
