my @a = < chocolade ipad >;
my @b = < camelia perl6 >;

# all-together(@a, @b);
# all-together(['chocolade', 'ipad'], ['camelia', 'perl6']);
# all-together(< chocolade ipad >, < camelia perl6 >);

# sub all-together(*@items) {
#     .say for @items;
# }


keep-groupped(@a, @b);
keep-groupped(['chocolade', 'ipad'], ['camelia', 'perl6']);
keep-groupped(< chocolade ipad >, < camelia perl6 >);

sub keep-groupped(**@items) {
    .say for @items;
}

sub happy-new-year() {
    "Happy new $*year year!"
}

my $*year = 2018;
say happy-new-year();