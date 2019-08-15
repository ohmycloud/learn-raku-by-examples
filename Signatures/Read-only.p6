use v6;

sub convert_currency($amount, $rate) {
    $amount = $amount * $rate;
    return $amount;
}

sub convert_currency_copy($amount is copy, $rate) {
    $amount = $amount * $rate;
    return $amount;
}

sub convert_currency_rw($amount is rw, $rate) {
    $amount = $amount * $rate;
    return $amount;
}

my $price = 99;
$price = convert_currency($price, 11.1);
$price_copy = convert_currency_copy($price, 11.1);
$price_rw = convert_currency_rw($price, 11.1);

say $price;
say $price_copy;
say $price_rw;
