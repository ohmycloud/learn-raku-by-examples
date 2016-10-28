class Journey {
    has $.origin;
    has $.destination;
    has @!travellers;
    has $.notes is rw;
}

# Create a new instance of the class.
my $vacation = Journey.new(
    origin      => 'Sweden',
    destination => 'Switzerland',
    notes       => 'Pack hiking gear!'
);

# 使用取值器, 这输出 Sweden.
say $vacation.origin;
# 使用 rw 存取器修改属性的值
$vacation.notes = 'Pack hiking gear and sunglasses!';
say $vacation.notes;
