my %hash =
    two   => 2,
    three => 3,
    one   => 1,
;

for %hash.sort(*.key)>>.kv -> ($key, $value) {
    say "'$key' => '$value'";
}