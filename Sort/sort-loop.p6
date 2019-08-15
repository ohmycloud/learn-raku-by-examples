my %hash =
    two   => 2,
    three => 3,
    one   => 1,
;

for %hash.sort -> (:$key, :$value) {
  say "'$key' => '$value'";
}

say "-" x 15;

for %hash.sort -> $pair (:$key, :$value) {
  say $pair;
  say $key === $pair.key and $value === $pair.value; # True␤
}

say "-" x 15;

# :$key is short for :key($key)
for %hash.sort -> (:key($k), :value($v)) {
  say "'$k' => '$v'";
}