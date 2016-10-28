use v6;
my $range = 'a' .. 'f';
for $range.list -> $elem {
    say $elem;
}

.say for @( $range );
# .say for $list.list;
.say for $range.flat;
