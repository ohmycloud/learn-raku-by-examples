class Journey {
    has $.origin;
    has $.destination;
    has @!travellers;
    has $.notes;  # 没有添加 is rw 限制时, 属性默认是只读的!
}

my $j = Journey.new(
    origin      => 'Sweden',
    destination => 'China',
    notes       => 'Be careful your money!'
);

say $j.origin;
say $j.destination;
say $j.notes;

# now, try to change notes
$j.notes = 'gun nima dan'; # Cannot modify an immutable Str
say $j.notes;
